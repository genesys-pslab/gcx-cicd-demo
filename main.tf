resource "genesyscloud_routing_queue" "cicd_queue" {
    name = "${var.gcxQueueName}_${var.gcxSuffix}"
    acw_timeout_ms = var.gcxAcwTimeout
    enable_manual_assignment = false
    
    bullseye_rings {
        expansion_timeout_seconds = 300
        skills_to_remove = ["${genesyscloud_routing_skill.cicd_skill_mobile.id}"]
    }
    bullseye_rings {
        expansion_timeout_seconds = 150
        skills_to_remove = ["${genesyscloud_routing_skill.cicd_skill_north.id}"]
    }
    bullseye_rings {
        expansion_timeout_seconds = 150
        skills_to_remove = ["${genesyscloud_routing_skill.cicd_skill_south.id}"]
    }
    wrapup_codes = [ 
        genesyscloud_routing_wrapupcode.cicd_wuc_happy.id,
        genesyscloud_routing_wrapupcode.cicd_wuc_unhappy.id 
    ]
}

resource "genesyscloud_routing_wrapupcode" "cicd_wuc_happy" {
    name = "Happy CI/CD Customer"
}

resource "genesyscloud_routing_wrapupcode" "cicd_wuc_unhappy" {
    name = "Unhappy CI/CD Customer"
}

resource "genesyscloud_routing_skill" "cicd_skill_mobile" {
  name = "${var.gcxSkillName}_main"
}

resource "genesyscloud_routing_skill" "cicd_skill_north" {
  name = "${var.gcxSkillName}_north"
}

resource "genesyscloud_routing_skill" "cicd_skill_south" {
  name = "${var.gcxSkillName}_south"
}