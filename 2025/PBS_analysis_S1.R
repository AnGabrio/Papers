#import cleaned data 

PBS_dataset_quest<- readRDS("PBS_dataset_quest.rds")

#idea: model HRU outcomes instead of cost outcomes to naturally deal 
#with missing values in HRU questionnaire without making ad-hoc assumptions (e.g. = 0) about
#missing HRU values first

#type of HRU categories for PBS trial
#remove data for patient not allocated (244 left, 136 in TAU and 108 in PBS collected across 12 sites and 11 sites, respectively)

PBS_dataset_quest <- PBS_dataset_quest[-which(is.na(PBS_dataset_quest$group.x)),]

#community care services 
#(gpsurgery_visits, gphome_visits, gpphone_visits, comnurse_visits, psynurse_visits,
#ldnnurse_visits,socialwork_visits,psych_visits,socialwork_visits,occ_ther_visits,art_ther_visits,
#alt_ther_visits,couns_visits,physio_visits,dentist_visits,speech_ther_visits,comwork_visits)

PBS_dataset_quest_cc_hruT0 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,31:81)]]
#combine HRU for public/private/voluntary since same unit price applies
PBS_dataset_quest_cc_hruT0$T0ldnnurse_visits_all <- PBS_dataset_quest_cc_hruT0$T0ldnnurse_visits + PBS_dataset_quest_cc_hruT0$T0ldnnurse_priv_visits
PBS_dataset_quest_cc_hruT0$T0socialwork_visits_all <- PBS_dataset_quest_cc_hruT0$T0socialwork_visits + PBS_dataset_quest_cc_hruT0$T0socialwork_priv_visits
PBS_dataset_quest_cc_hruT0$T0occ_ther_visits_all <- PBS_dataset_quest_cc_hruT0$T0occ_ther_visits + PBS_dataset_quest_cc_hruT0$T0occ_ther_priv_visits
PBS_dataset_quest_cc_hruT0$T0art_ther_visits_all <- PBS_dataset_quest_cc_hruT0$T0art_ther_visits + PBS_dataset_quest_cc_hruT0$T0art_ther_priv_visits + PBS_dataset_quest_cc_hruT0$T0art_ther_vol_visits
PBS_dataset_quest_cc_hruT0$T0alt_ther_visits_all <- PBS_dataset_quest_cc_hruT0$T0alt_ther_visits + PBS_dataset_quest_cc_hruT0$T0alt_ther_priv_visits 
PBS_dataset_quest_cc_hruT0$T0speech_ther_visits_all <- PBS_dataset_quest_cc_hruT0$T0speech_ther_visits + PBS_dataset_quest_cc_hruT0$T0speech_ther_priv_visits + PBS_dataset_quest_cc_hruT0$T0speech_ther_vol_visits
PBS_dataset_quest_cc_hruT0$T0comwork_visits_all <- PBS_dataset_quest_cc_hruT0$T0comwork_visits + PBS_dataset_quest_cc_hruT0$T0comwork_priv_visits + PBS_dataset_quest_cc_hruT0$T0comwork_vol_visits

PBS_dataset_quest_cc_hruT1 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,224:273)]]
#combine HRU for public/private/voluntary since same unit price applies
PBS_dataset_quest_cc_hruT1$T1ldnnurse_visits_all <- PBS_dataset_quest_cc_hruT1$T1ldnnurse_visits + PBS_dataset_quest_cc_hruT1$T1ldnnurse_priv_visits
PBS_dataset_quest_cc_hruT1$T1socialwork_visits_all <- PBS_dataset_quest_cc_hruT1$T1socialwork_visits + PBS_dataset_quest_cc_hruT1$T1socialwork_priv_visits
PBS_dataset_quest_cc_hruT1$T1occ_ther_visits_all <- PBS_dataset_quest_cc_hruT1$T1occ_ther_visits + PBS_dataset_quest_cc_hruT1$T1occ_ther_priv_visits
PBS_dataset_quest_cc_hruT1$T1art_ther_visits_all <- PBS_dataset_quest_cc_hruT1$T1art_ther_visits + PBS_dataset_quest_cc_hruT1$T1art_ther_priv_visits + PBS_dataset_quest_cc_hruT1$T1art_ther_vol_visits
PBS_dataset_quest_cc_hruT1$T1alt_ther_visits_all <- PBS_dataset_quest_cc_hruT1$T1alt_ther_visits + PBS_dataset_quest_cc_hruT1$T1alt_ther_priv_visits 
PBS_dataset_quest_cc_hruT1$T1speech_ther_visits_all <- PBS_dataset_quest_cc_hruT1$T1speech_ther_visits + PBS_dataset_quest_cc_hruT1$T1speech_ther_priv_visits + PBS_dataset_quest_cc_hruT1$T1speech_ther_vol_visits
PBS_dataset_quest_cc_hruT1$T1comwork_visits_all <- PBS_dataset_quest_cc_hruT1$T1comwork_visits + PBS_dataset_quest_cc_hruT1$T1comwork_priv_visits + PBS_dataset_quest_cc_hruT1$T1comwork_vol_visits

PBS_dataset_quest_cc_hruT2 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,416:465)]]
#combine HRU for public/private/voluntary since same unit price applies
PBS_dataset_quest_cc_hruT2$T2ldnnurse_visits_all <- PBS_dataset_quest_cc_hruT2$T2ldnnurse_visits + PBS_dataset_quest_cc_hruT2$T2ldnnurse_priv_visits
PBS_dataset_quest_cc_hruT2$T2socialwork_visits_all <- PBS_dataset_quest_cc_hruT2$T2socialwork_visits + PBS_dataset_quest_cc_hruT2$T2socialwork_priv_visits
PBS_dataset_quest_cc_hruT2$T2occ_ther_visits_all <- PBS_dataset_quest_cc_hruT2$T2occ_ther_visits + PBS_dataset_quest_cc_hruT2$T2occ_ther_priv_visits
PBS_dataset_quest_cc_hruT2$T2art_ther_visits_all <- PBS_dataset_quest_cc_hruT2$T2art_ther_visits + PBS_dataset_quest_cc_hruT2$T2art_ther_priv_visits + PBS_dataset_quest_cc_hruT2$T2art_ther_vol_visits
PBS_dataset_quest_cc_hruT2$T2alt_ther_visits_all <- PBS_dataset_quest_cc_hruT2$T2alt_ther_visits + PBS_dataset_quest_cc_hruT2$T2alt_ther_priv_visits 
PBS_dataset_quest_cc_hruT2$T2speech_ther_visits_all <- PBS_dataset_quest_cc_hruT2$T2speech_ther_visits + PBS_dataset_quest_cc_hruT2$T2speech_ther_priv_visits + PBS_dataset_quest_cc_hruT2$T2speech_ther_vol_visits
PBS_dataset_quest_cc_hruT2$T2comwork_visits_all <- PBS_dataset_quest_cc_hruT2$T2comwork_visits + PBS_dataset_quest_cc_hruT2$T2comwork_priv_visits + PBS_dataset_quest_cc_hruT2$T2comwork_vol_visits

#acute care services 
#(elec_inpcare_visits,nonelec_inpcare_visits,icu_visits,ae_admitted_visits,
#ae_notadmitted_visits,daycase_visits,outp_visits)

PBS_dataset_quest_ac_hruT0 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,83:91,93,94)]]
PBS_dataset_quest_ac_hruT1<- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,275:283,285,286)]]
PBS_dataset_quest_ac_hruT2 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,467:475,477,478)]]

#secondary mental health services
#(inpcare_visits, psych_outp_visits)

PBS_dataset_quest_smh_hruT0 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,82,92)]]
PBS_dataset_quest_smh_hruT1 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,274,284)]]
PBS_dataset_quest_smh_hruT2 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,466,476)]]

#total health care services
#(community care, acute care, secondary mental health)

PBS_dataset_quest_thc_hruT0 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,31:94)]]
PBS_dataset_quest_thc_hruT1 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,224:286)]]
PBS_dataset_quest_thc_hruT2 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,416:478)]]

#criminal justice services
#(cjc_contact1,cjc_contact2,cjc_contact,court_crim,court_civil)

PBS_dataset_quest_cj_hruT0 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,95:99)]]
PBS_dataset_quest_cj_hruT1 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,287:291)]]
PBS_dataset_quest_cj_hruT2 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,479:483)]]

#total services
#(total health care, criminal justice)

PBS_dataset_quest_tot_hruT0 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,31:99)]]
PBS_dataset_quest_tot_hruT1 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,224:291)]]
PBS_dataset_quest_tot_hruT2 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,416:483)]]

#hrqol
#(eq5d)
PBS_dataset_quest_eq5dT0 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,132:136)]]
PBS_dataset_quest_eq5dT1 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,324:328)]]
PBS_dataset_quest_eq5dT2 <- PBS_dataset_quest[,names(PBS_dataset_quest)[c(1,2,101,516:520)]]

#########################################################################################
#calculate total costs by type of HRU to see how many missing observations

PBS_dataset_quest$T0_cc_total_cost <- PBS_dataset_quest$T0gpsurgery_cost + PBS_dataset_quest$T0gphome_cost +
  PBS_dataset_quest$T0gpphone_cost + PBS_dataset_quest$T0comnurse_cost + PBS_dataset_quest$T0psynurse_cost +
  PBS_dataset_quest$T0ldnnurse_cost + PBS_dataset_quest$T0psydr_cost + PBS_dataset_quest$T0psych_cost +
  PBS_dataset_quest$T0socialwork_cost + PBS_dataset_quest$T0occ_ther_cost + PBS_dataset_quest$T0art_ther_cost +
  PBS_dataset_quest$T0alt_ther_cost + PBS_dataset_quest$T0couns_cost + PBS_dataset_quest$T0physio_cost +
  PBS_dataset_quest$T0dentist_cost + PBS_dataset_quest$T0speech_ther_cost + PBS_dataset_quest$T0comwork_cost
  
PBS_dataset_quest$T1_cc_total_cost <- PBS_dataset_quest$T1gpsurgery_cost + PBS_dataset_quest$T1gphome_cost +
  PBS_dataset_quest$T1gpphone_cost + PBS_dataset_quest$T1comnurse_cost + PBS_dataset_quest$T1psynurse_cost +
  PBS_dataset_quest$T1ldnnurse_cost + PBS_dataset_quest$T1psydr_cost + PBS_dataset_quest$T1psych_cost +
  PBS_dataset_quest$T1socialwork_cost + PBS_dataset_quest$T1occ_ther_cost + PBS_dataset_quest$T1art_ther_cost +
  PBS_dataset_quest$T1alt_ther_cost + PBS_dataset_quest$T1couns_cost + PBS_dataset_quest$T1physio_cost +
  PBS_dataset_quest$T1dentist_cost + PBS_dataset_quest$T1speech_ther_cost + PBS_dataset_quest$T1comwork_cost

PBS_dataset_quest$T2_cc_total_cost <- PBS_dataset_quest$T2gpsurgery_cost + PBS_dataset_quest$T2gphome_cost +
  PBS_dataset_quest$T2gpphone_cost + PBS_dataset_quest$T2comnurse_cost + PBS_dataset_quest$T2psynurse_cost +
  PBS_dataset_quest$T2ldnnurse_cost + PBS_dataset_quest$T2psydr_cost + PBS_dataset_quest$T2psych_cost +
  PBS_dataset_quest$T2socialwork_cost + PBS_dataset_quest$T2occ_ther_cost + PBS_dataset_quest$T2art_ther_cost +
  PBS_dataset_quest$T2alt_ther_cost + PBS_dataset_quest$T2couns_cost + PBS_dataset_quest$T2physio_cost +
  PBS_dataset_quest$T2dentist_cost + PBS_dataset_quest$T2speech_ther_cost + PBS_dataset_quest$T2comwork_cost


PBS_dataset_quest$T0_ac_total_cost <- PBS_dataset_quest$T0elec_inpcare_cost + PBS_dataset_quest$T0nonelec_inpcare_cost +
  PBS_dataset_quest$T0icu_cost + PBS_dataset_quest$T0ae_admitted_cost + PBS_dataset_quest$T0ae_notadmitted_cost +
  PBS_dataset_quest$T0daycase_cost + PBS_dataset_quest$T0outp_cost

PBS_dataset_quest$T1_ac_total_cost <- PBS_dataset_quest$T1elec_inpcare_cost + PBS_dataset_quest$T1nonelec_inpcare_cost +
  PBS_dataset_quest$T1icu_cost + PBS_dataset_quest$T1ae_admitted_cost + PBS_dataset_quest$T1ae_notadmitted_cost +
  PBS_dataset_quest$T1daycase_cost + PBS_dataset_quest$T1outp_cost

PBS_dataset_quest$T2_ac_total_cost <- PBS_dataset_quest$T2elec_inpcare_cost + PBS_dataset_quest$T2nonelec_inpcare_cost +
  PBS_dataset_quest$T2icu_cost + PBS_dataset_quest$T2ae_admitted_cost + PBS_dataset_quest$T2ae_notadmitted_cost +
  PBS_dataset_quest$T2daycase_cost + PBS_dataset_quest$T2outp_cost


PBS_dataset_quest$T0_smh_total_cost <- PBS_dataset_quest$T0inpcare_cost + PBS_dataset_quest$T0psych_outp_cost
PBS_dataset_quest$T1_smh_total_cost <- PBS_dataset_quest$T1inpcare_cost + PBS_dataset_quest$T1psych_outp_cost
PBS_dataset_quest$T2_smh_total_cost <- PBS_dataset_quest$T2inpcare_cost + PBS_dataset_quest$T2psych_outp_cost

PBS_dataset_quest$T0_hc_total_cost <- PBS_dataset_quest$T0_cc_total_cost + PBS_dataset_quest$T0_ac_total_cost + PBS_dataset_quest$T0_smh_total_cost
PBS_dataset_quest$T1_hc_total_cost <- PBS_dataset_quest$T1_cc_total_cost + PBS_dataset_quest$T1_ac_total_cost + PBS_dataset_quest$T1_smh_total_cost
PBS_dataset_quest$T2_hc_total_cost <- PBS_dataset_quest$T2_cc_total_cost + PBS_dataset_quest$T2_ac_total_cost + PBS_dataset_quest$T2_smh_total_cost

PBS_dataset_quest$T0_cj_total_cost <- PBS_dataset_quest$T0cjc_contact_cost + PBS_dataset_quest$T0cjc_contact2_cost + PBS_dataset_quest$T0court_crim_cost + PBS_dataset_quest$T0court_civil_cost
PBS_dataset_quest$T1_cj_total_cost <- PBS_dataset_quest$T1cjc_contact_cost + PBS_dataset_quest$T1cjc_contact2_cost + PBS_dataset_quest$T1court_crim_cost + PBS_dataset_quest$T1court_civil_cost
PBS_dataset_quest$T2_cj_total_cost <- PBS_dataset_quest$T2cjc_contact_cost + PBS_dataset_quest$T2cjc_contact2_cost + PBS_dataset_quest$T2court_crim_cost + PBS_dataset_quest$T2court_civil_cost


#check HRU missingness patterns
library(mice)
library(VIM)

#missingness patterns for cc HRU 
md.pattern(PBS_dataset_quest_cc_hruT0)
md.pattern(PBS_dataset_quest_cc_hruT1)
md.pattern(PBS_dataset_quest_cc_hruT2)
aggr(PBS_dataset_quest_cc_hruT0, combined=FALSE, only.miss=TRUE, sortVars=TRUE)
aggr(PBS_dataset_quest_cc_hruT1, combined=FALSE, only.miss=TRUE, sortVars=TRUE)
aggr(PBS_dataset_quest_cc_hruT2, combined=FALSE, only.miss=TRUE, sortVars=TRUE)

#number of individuals with fully missing observations on HRU
id_full_miss_hruT0 <- which(rowSums(is.na(PBS_dataset_quest_cc_hruT0[4:61]))==ncol(PBS_dataset_quest_cc_hruT0[4:61]))
#0 at T0
id_full_miss_hruT1 <- which(rowSums(is.na(PBS_dataset_quest_cc_hruT1[4:60]))==ncol(PBS_dataset_quest_cc_hruT1[4:60]))
n_full_miss_hruT1 <- length(id_full_miss_hruT1)
#12 at T1
id_full_miss_hruT2 <- which(rowSums(is.na(PBS_dataset_quest_cc_hruT2[4:60]))==ncol(PBS_dataset_quest_cc_hruT2[4:60]))
n_full_miss_hruT2 <- length(id_full_miss_hruT2)
#9 at T2

#number of individuals with partially missing observations on HRU
PBS_dataset_quest_cc_hruT0_partial <- PBS_dataset_quest_cc_hruT0
PBS_dataset_quest_cc_hruT0_partial <- PBS_dataset_quest_cc_hruT0_partial[complete.cases(PBS_dataset_quest_cc_hruT0_partial)==FALSE,]
#10 at T0
PBS_dataset_quest_cc_hruT1_partial <- PBS_dataset_quest_cc_hruT1[-id_full_miss_hruT1,]
PBS_dataset_quest_cc_hruT1_partial <- PBS_dataset_quest_cc_hruT1_partial[complete.cases(PBS_dataset_quest_cc_hruT1_partial)==FALSE,]
#10 at T1
PBS_dataset_quest_cc_hruT2_partial <- PBS_dataset_quest_cc_hruT2[-id_full_miss_hruT2,]
PBS_dataset_quest_cc_hruT2_partial <- PBS_dataset_quest_cc_hruT2_partial[complete.cases(PBS_dataset_quest_cc_hruT2_partial)==FALSE,]
#8 at T2

 
#missingness patterns for ac HRU  
md.pattern(PBS_dataset_quest_ac_hruT0)
md.pattern(PBS_dataset_quest_ac_hruT1)
md.pattern(PBS_dataset_quest_ac_hruT2)
aggr(PBS_dataset_quest_ac_hruT0, combined=FALSE, only.miss=TRUE, sortVars=TRUE)
aggr(PBS_dataset_quest_ac_hruT1, combined=FALSE, only.miss=TRUE, sortVars=TRUE)
aggr(PBS_dataset_quest_ac_hruT2, combined=FALSE, only.miss=TRUE, sortVars=TRUE)

#missingness patterns for smh HRU  
md.pattern(PBS_dataset_quest_smh_hruT0)
md.pattern(PBS_dataset_quest_smh_hruT1)
md.pattern(PBS_dataset_quest_smh_hruT2)
aggr(PBS_dataset_quest_smh_hruT0, combined=FALSE, only.miss=TRUE, sortVars=TRUE)
aggr(PBS_dataset_quest_smh_hruT1, combined=FALSE, only.miss=TRUE, sortVars=TRUE)
aggr(PBS_dataset_quest_smh_hruT2, combined=FALSE, only.miss=TRUE, sortVars=TRUE)

#missingness patterns for cj HRU  
md.pattern(PBS_dataset_quest_cj_hruT0)
md.pattern(PBS_dataset_quest_cj_hruT1)
md.pattern(PBS_dataset_quest_cj_hruT2)
aggr(PBS_dataset_quest_cj_hruT0, combined=FALSE, only.miss=TRUE, sortVars=TRUE)
aggr(PBS_dataset_quest_cj_hruT1, combined=FALSE, only.miss=TRUE, sortVars=TRUE)
aggr(PBS_dataset_quest_cj_hruT2, combined=FALSE, only.miss=TRUE, sortVars=TRUE)

#only focus on modelling of cc HRU since ac, smh, cj have only fully missing/observed patterns
#if needed could be included later on as cost variables in the model

PBS_dataset_quest_cc_hruT0 <- PBS_dataset_quest_cc_hruT0[, names(PBS_dataset_quest_cc_hruT0) %in% c("T0gpsurgery_visits","T0gphome_visits","T0gpphone_visits",
                                                                                                    "T0comnurse_visits","T0psynurse_visits","T0ldnnurse_visits_all",
                                                                                                    "T0psydr_visits","T0psych_visits","T0socialwork_visits_all",
                                                                                                    "T0occ_ther_visits_all","T0art_ther_visits_all","T0alt_ther_visits_all",
                                                                                                    "T0couns_visits","T0physio_visits","T0dentist_visits","T0speech_ther_visits_all",
                                                                                                    "T0comwork_visits_all")]
PBS_dataset_quest_cc_hruT1 <- PBS_dataset_quest_cc_hruT1[, names(PBS_dataset_quest_cc_hruT1) %in% c("T1gpsurgery_visits","T1gphome_visits","T1gpphone_visits",
                                                                                                    "T1comnurse_visits","T1psynurse_visits","T1ldnnurse_visits_all",
                                                                                                    "T1psydr_visits","T1psych_visits","T1socialwork_visits_all",
                                                                                                    "T1occ_ther_visits_all","T1art_ther_visits_all","T1alt_ther_visits_all",
                                                                                                    "T1couns_visits","T1physio_visits","T1dentist_visits","T1speech_ther_visits_all",
                                                                                                    "T1comwork_visits_all")]
PBS_dataset_quest_cc_hruT2 <- PBS_dataset_quest_cc_hruT2[, names(PBS_dataset_quest_cc_hruT2) %in% c("T2gpsurgery_visits","T2gphome_visits","T2gpphone_visits",
                                                                                                    "T2comnurse_visits","T2psynurse_visits","T2ldnnurse_visits_all",
                                                                                                    "T2psydr_visits","T2psych_visits","T2socialwork_visits_all",
                                                                                                    "T2occ_ther_visits_all","T2art_ther_visits_all","T2alt_ther_visits_all",
                                                                                                    "T2couns_visits","T2physio_visits","T2dentist_visits","T2speech_ther_visits_all",
                                                                                                    "T2comwork_visits_all")]


#missingness patterns for cc HRU 
md.pattern(PBS_dataset_quest_cc_hruT0)
md.pattern(PBS_dataset_quest_cc_hruT1)
md.pattern(PBS_dataset_quest_cc_hruT2)
aggr(PBS_dataset_quest_cc_hruT0, combined=FALSE, only.miss=TRUE, sortVars=TRUE)
aggr(PBS_dataset_quest_cc_hruT1, combined=FALSE, only.miss=TRUE, sortVars=TRUE)
aggr(PBS_dataset_quest_cc_hruT2, combined=FALSE, only.miss=TRUE, sortVars=TRUE)

#inspect empirical distributions of cc HRU
#could aggregate some of HRU types based on content but need to find a weighted price
PBS_dataset_quest_cc_hruT0$T0gp_visits <- PBS_dataset_quest_cc_hruT0$T0gpsurgery_visits + PBS_dataset_quest_cc_hruT0$T0gphome_visits + PBS_dataset_quest_cc_hruT0$T0gpphone_visits
PBS_dataset_quest_cc_hruT0$T0nurse_visits <- PBS_dataset_quest_cc_hruT0$T0comnurse_visits + PBS_dataset_quest_cc_hruT0$T0psynurse_visits + PBS_dataset_quest_cc_hruT0$T0ldnnurse_visits_all
PBS_dataset_quest_cc_hruT0$T0therapist_visits <- PBS_dataset_quest_cc_hruT0$T0occ_ther_visits_all + PBS_dataset_quest_cc_hruT0$T0art_ther_visits_all + PBS_dataset_quest_cc_hruT0$T0alt_ther_visits_all + PBS_dataset_quest_cc_hruT0$T0speech_ther_visits_all

PBS_dataset_quest_cc_hruT1$T1gp_visits <- PBS_dataset_quest_cc_hruT1$T1gpsurgery_visits + PBS_dataset_quest_cc_hruT1$T1gphome_visits + PBS_dataset_quest_cc_hruT1$T1gpphone_visits
PBS_dataset_quest_cc_hruT1$T1nurse_visits <- PBS_dataset_quest_cc_hruT1$T1comnurse_visits + PBS_dataset_quest_cc_hruT1$T1psynurse_visits + PBS_dataset_quest_cc_hruT1$T1ldnnurse_visits_all
PBS_dataset_quest_cc_hruT1$T1therapist_visits <- PBS_dataset_quest_cc_hruT1$T1occ_ther_visits_all + PBS_dataset_quest_cc_hruT1$T1art_ther_visits_all + PBS_dataset_quest_cc_hruT1$T1alt_ther_visits_all + PBS_dataset_quest_cc_hruT1$T1speech_ther_visits_all

PBS_dataset_quest_cc_hruT2$T2gp_visits <- PBS_dataset_quest_cc_hruT2$T2gpsurgery_visits + PBS_dataset_quest_cc_hruT2$T2gphome_visits + PBS_dataset_quest_cc_hruT2$T2gpphone_visits
PBS_dataset_quest_cc_hruT2$T2nurse_visits <- PBS_dataset_quest_cc_hruT2$T2comnurse_visits + PBS_dataset_quest_cc_hruT2$T2psynurse_visits + PBS_dataset_quest_cc_hruT2$T2ldnnurse_visits_all
PBS_dataset_quest_cc_hruT2$T2therapist_visits <- PBS_dataset_quest_cc_hruT2$T2occ_ther_visits_all + PBS_dataset_quest_cc_hruT2$T2art_ther_visits_all + PBS_dataset_quest_cc_hruT2$T2alt_ther_visits_all + PBS_dataset_quest_cc_hruT2$T2speech_ther_visits_all


#gp
hist(PBS_dataset_quest_cc_hruT0$T0gpsurgery_visits)
summary(PBS_dataset_quest_cc_hruT0$T0gpsurgery_visits)
table(PBS_dataset_quest_cc_hruT0$T0gpsurgery_visits)
hist(PBS_dataset_quest_cc_hruT0$T0gphome_visits)
summary(PBS_dataset_quest_cc_hruT0$T0gphome_visits)
table(PBS_dataset_quest_cc_hruT0$T0gphome_visits)
hist(PBS_dataset_quest_cc_hruT0$T0gpphone_visits)
summary(PBS_dataset_quest_cc_hruT0$T0gpphone_visits)
table(PBS_dataset_quest_cc_hruT0$T0gpphone_visits)
#gp aggregated
hist(PBS_dataset_quest_cc_hruT0$T0gp_visits)
summary(PBS_dataset_quest_cc_hruT0$T0gp_visits)
table(PBS_dataset_quest_cc_hruT0$T0gp_visits)
#nurse
hist(PBS_dataset_quest_cc_hruT0$T0comnurse_visits)
summary(PBS_dataset_quest_cc_hruT0$T0comnurse_visits)
table(PBS_dataset_quest_cc_hruT0$T0comnurse_visits)
hist(PBS_dataset_quest_cc_hruT0$T0psynurse_visits)
summary(PBS_dataset_quest_cc_hruT0$T0psynurse_visits)
table(PBS_dataset_quest_cc_hruT0$T0psynurse_visits)
hist(PBS_dataset_quest_cc_hruT0$T0ldnnurse_visits_all)
summary(PBS_dataset_quest_cc_hruT0$T0ldnnurse_visits_all)
table(PBS_dataset_quest_cc_hruT0$T0ldnnurse_visits_all)
#nurse aggregated
hist(PBS_dataset_quest_cc_hruT0$T0nurse_visits)
summary(PBS_dataset_quest_cc_hruT0$T0nurse_visits)
table(PBS_dataset_quest_cc_hruT0$T0nurse_visits)
#psychiatric doctor
hist(PBS_dataset_quest_cc_hruT0$T0psydr_visits)
summary(PBS_dataset_quest_cc_hruT0$T0psydr_visits)
table(PBS_dataset_quest_cc_hruT0$T0psydr_visits)
#psychologist
hist(PBS_dataset_quest_cc_hruT0$T0psych_visits)
summary(PBS_dataset_quest_cc_hruT0$T0psych_visits)
table(PBS_dataset_quest_cc_hruT0$T0psych_visits)
#physiotherapist
hist(PBS_dataset_quest_cc_hruT0$T0physio_visits)
summary(PBS_dataset_quest_cc_hruT0$T0physio_visits)
table(PBS_dataset_quest_cc_hruT0$T0physio_visits)
#counsellor
hist(PBS_dataset_quest_cc_hruT0$T0couns_visits)
summary(PBS_dataset_quest_cc_hruT0$T0couns_visits)
table(PBS_dataset_quest_cc_hruT0$T0couns_visits)
#dentist
hist(PBS_dataset_quest_cc_hruT0$T0dentist_visits)
summary(PBS_dataset_quest_cc_hruT0$T0dentist_visits)
table(PBS_dataset_quest_cc_hruT0$T0dentist_visits)
#social worker
hist(PBS_dataset_quest_cc_hruT0$T0socialwork_visits_all)
summary(PBS_dataset_quest_cc_hruT0$T0socialwork_visits_all)
table(PBS_dataset_quest_cc_hruT0$T0socialwork_visits_all)
#community worker
hist(PBS_dataset_quest_cc_hruT0$T0comwork_visits_all)
summary(PBS_dataset_quest_cc_hruT0$T0comwork_visits_all)
table(PBS_dataset_quest_cc_hruT0$T0comwork_visits_all)
#therapist worker
hist(PBS_dataset_quest_cc_hruT0$T0occ_ther_visits_all)
summary(PBS_dataset_quest_cc_hruT0$T0occ_ther_visits_all)
table(PBS_dataset_quest_cc_hruT0$T0occ_ther_visits_all)
hist(PBS_dataset_quest_cc_hruT0$T0art_ther_visits_all)
summary(PBS_dataset_quest_cc_hruT0$T0art_ther_visits_all)
table(PBS_dataset_quest_cc_hruT0$T0art_ther_visits_all)
hist(PBS_dataset_quest_cc_hruT0$T0alt_ther_visits_all)
summary(PBS_dataset_quest_cc_hruT0$T0alt_ther_visits_all)
table(PBS_dataset_quest_cc_hruT0$T0alt_ther_visits_all)
hist(PBS_dataset_quest_cc_hruT0$T0speech_ther_visits_all)
summary(PBS_dataset_quest_cc_hruT0$T0speech_ther_visits_all)
table(PBS_dataset_quest_cc_hruT0$T0speech_ther_visits_all)
#therapist aggregated
hist(PBS_dataset_quest_cc_hruT0$T0therapist_visits)
summary(PBS_dataset_quest_cc_hruT0$T0therapist_visits)
table(PBS_dataset_quest_cc_hruT0$T0therapist_visits)


#gp
hist(PBS_dataset_quest_cc_hruT1$T1gpsurgery_visits)
summary(PBS_dataset_quest_cc_hruT1$T1gpsurgery_visits)
table(PBS_dataset_quest_cc_hruT1$T1gpsurgery_visits)
hist(PBS_dataset_quest_cc_hruT1$T1gphome_visits)
summary(PBS_dataset_quest_cc_hruT1$T1gphome_visits)
table(PBS_dataset_quest_cc_hruT1$T1gphome_visits)
hist(PBS_dataset_quest_cc_hruT1$T1gpphone_visits)
summary(PBS_dataset_quest_cc_hruT1$T1gpphone_visits)
table(PBS_dataset_quest_cc_hruT1$T1gpphone_visits)
#gp aggregated
hist(PBS_dataset_quest_cc_hruT1$T1gp_visits)
summary(PBS_dataset_quest_cc_hruT1$T1gp_visits)
table(PBS_dataset_quest_cc_hruT1$T1gp_visits)
#nurse
hist(PBS_dataset_quest_cc_hruT1$T1comnurse_visits)
summary(PBS_dataset_quest_cc_hruT1$T1comnurse_visits)
table(PBS_dataset_quest_cc_hruT1$T1comnurse_visits)
hist(PBS_dataset_quest_cc_hruT1$T1psynurse_visits)
summary(PBS_dataset_quest_cc_hruT1$T1psynurse_visits)
table(PBS_dataset_quest_cc_hruT1$T1psynurse_visits)
hist(PBS_dataset_quest_cc_hruT1$T1ldnnurse_visits_all)
summary(PBS_dataset_quest_cc_hruT1$T1ldnnurse_visits_all)
table(PBS_dataset_quest_cc_hruT1$T1ldnnurse_visits_all)
#nurse aggregated
hist(PBS_dataset_quest_cc_hruT1$T1nurse_visits)
summary(PBS_dataset_quest_cc_hruT1$T1nurse_visits)
table(PBS_dataset_quest_cc_hruT1$T1nurse_visits)
#psychiatric doctor
hist(PBS_dataset_quest_cc_hruT1$T1psydr_visits)
summary(PBS_dataset_quest_cc_hruT1$T1psydr_visits)
table(PBS_dataset_quest_cc_hruT1$T1psydr_visits)
#psychologist
hist(PBS_dataset_quest_cc_hruT1$T1psych_visits)
summary(PBS_dataset_quest_cc_hruT1$T1psych_visits)
table(PBS_dataset_quest_cc_hruT1$T1psych_visits)
#physiotherapist
hist(PBS_dataset_quest_cc_hruT1$T1physio_visits)
summary(PBS_dataset_quest_cc_hruT1$T1physio_visits)
table(PBS_dataset_quest_cc_hruT1$T1physio_visits)
#counsellor
hist(PBS_dataset_quest_cc_hruT1$T1couns_visits)
summary(PBS_dataset_quest_cc_hruT1$T1couns_visits)
table(PBS_dataset_quest_cc_hruT1$T1couns_visits)
#dentist
hist(PBS_dataset_quest_cc_hruT1$T1dentist_visits)
summary(PBS_dataset_quest_cc_hruT1$T1dentist_visits)
table(PBS_dataset_quest_cc_hruT1$T1dentist_visits)
#social worker
hist(PBS_dataset_quest_cc_hruT1$T1socialwork_visits_all)
summary(PBS_dataset_quest_cc_hruT1$T1socialwork_visits_all)
table(PBS_dataset_quest_cc_hruT1$T1socialwork_visits_all)
#community worker
hist(PBS_dataset_quest_cc_hruT1$T1comwork_visits_all)
summary(PBS_dataset_quest_cc_hruT1$T1comwork_visits_all)
table(PBS_dataset_quest_cc_hruT1$T1comwork_visits_all)
#therapist worker
hist(PBS_dataset_quest_cc_hruT1$T1occ_ther_visits_all)
summary(PBS_dataset_quest_cc_hruT1$T1occ_ther_visits_all)
table(PBS_dataset_quest_cc_hruT1$T1occ_ther_visits_all)
hist(PBS_dataset_quest_cc_hruT1$T1art_ther_visits_all)
summary(PBS_dataset_quest_cc_hruT1$T1art_ther_visits_all)
table(PBS_dataset_quest_cc_hruT1$T1art_ther_visits_all)
hist(PBS_dataset_quest_cc_hruT1$T1alt_ther_visits_all)
summary(PBS_dataset_quest_cc_hruT1$T1alt_ther_visits_all)
table(PBS_dataset_quest_cc_hruT1$T1alt_ther_visits_all)
hist(PBS_dataset_quest_cc_hruT1$T1speech_ther_visits_all)
summary(PBS_dataset_quest_cc_hruT1$T1speech_ther_visits_all)
table(PBS_dataset_quest_cc_hruT1$T1speech_ther_visits_all)
#therapist aggregated
hist(PBS_dataset_quest_cc_hruT1$T1therapist_visits)
summary(PBS_dataset_quest_cc_hruT1$T1therapist_visits)
table(PBS_dataset_quest_cc_hruT1$T1therapist_visits)


#gp
hist(PBS_dataset_quest_cc_hruT2$T2gpsurgery_visits)
summary(PBS_dataset_quest_cc_hruT2$T2gpsurgery_visits)
table(PBS_dataset_quest_cc_hruT2$T2gpsurgery_visits)
hist(PBS_dataset_quest_cc_hruT2$T2gphome_visits)
summary(PBS_dataset_quest_cc_hruT2$T2gphome_visits)
table(PBS_dataset_quest_cc_hruT2$T2gphome_visits)
hist(PBS_dataset_quest_cc_hruT2$T2gpphone_visits)
summary(PBS_dataset_quest_cc_hruT2$T2gpphone_visits)
table(PBS_dataset_quest_cc_hruT2$T2gpphone_visits)
#gp aggregated
hist(PBS_dataset_quest_cc_hruT2$T2gp_visits)
summary(PBS_dataset_quest_cc_hruT2$T2gp_visits)
table(PBS_dataset_quest_cc_hruT2$T2gp_visits)
#nurse
hist(PBS_dataset_quest_cc_hruT2$T2comnurse_visits)
summary(PBS_dataset_quest_cc_hruT2$T2comnurse_visits)
table(PBS_dataset_quest_cc_hruT2$T2comnurse_visits)
hist(PBS_dataset_quest_cc_hruT2$T2psynurse_visits)
summary(PBS_dataset_quest_cc_hruT2$T2psynurse_visits)
table(PBS_dataset_quest_cc_hruT2$T2psynurse_visits)
hist(PBS_dataset_quest_cc_hruT2$T2ldnnurse_visits_all)
summary(PBS_dataset_quest_cc_hruT2$T2ldnnurse_visits_all)
table(PBS_dataset_quest_cc_hruT2$T2ldnnurse_visits_all)
#nurse aggregated
hist(PBS_dataset_quest_cc_hruT2$T2nurse_visits)
summary(PBS_dataset_quest_cc_hruT2$T2nurse_visits)
table(PBS_dataset_quest_cc_hruT2$T2nurse_visits)
#psychiatric doctor
hist(PBS_dataset_quest_cc_hruT2$T2psydr_visits)
summary(PBS_dataset_quest_cc_hruT2$T2psydr_visits)
table(PBS_dataset_quest_cc_hruT2$T2psydr_visits)
#psychologist
hist(PBS_dataset_quest_cc_hruT2$T2psych_visits)
summary(PBS_dataset_quest_cc_hruT2$T2psych_visits)
table(PBS_dataset_quest_cc_hruT2$T2psych_visits)
#physiotherapist
hist(PBS_dataset_quest_cc_hruT2$T2physio_visits)
summary(PBS_dataset_quest_cc_hruT2$T2physio_visits)
table(PBS_dataset_quest_cc_hruT2$T2physio_visits)
#counsellor
hist(PBS_dataset_quest_cc_hruT2$T2couns_visits)
summary(PBS_dataset_quest_cc_hruT2$T2couns_visits)
table(PBS_dataset_quest_cc_hruT2$T2couns_visits)
#dentist
hist(PBS_dataset_quest_cc_hruT2$T2dentist_visits)
summary(PBS_dataset_quest_cc_hruT2$T2dentist_visits)
table(PBS_dataset_quest_cc_hruT2$T2dentist_visits)
#social worker
hist(PBS_dataset_quest_cc_hruT2$T2socialwork_visits_all)
summary(PBS_dataset_quest_cc_hruT2$T2socialwork_visits_all)
table(PBS_dataset_quest_cc_hruT2$T2socialwork_visits_all)
#community worker
hist(PBS_dataset_quest_cc_hruT2$T2comwork_visits_all)
summary(PBS_dataset_quest_cc_hruT2$T2comwork_visits_all)
table(PBS_dataset_quest_cc_hruT2$T2comwork_visits_all)
#therapist worker
hist(PBS_dataset_quest_cc_hruT2$T2occ_ther_visits_all)
summary(PBS_dataset_quest_cc_hruT2$T2occ_ther_visits_all)
table(PBS_dataset_quest_cc_hruT2$T2occ_ther_visits_all)
hist(PBS_dataset_quest_cc_hruT2$T2art_ther_visits_all)
summary(PBS_dataset_quest_cc_hruT2$T2art_ther_visits_all)
table(PBS_dataset_quest_cc_hruT2$T2art_ther_visits_all)
hist(PBS_dataset_quest_cc_hruT2$T2alt_ther_visits_all)
summary(PBS_dataset_quest_cc_hruT2$T2alt_ther_visits_all)
table(PBS_dataset_quest_cc_hruT2$T2alt_ther_visits_all)
hist(PBS_dataset_quest_cc_hruT2$T2speech_ther_visits_all)
summary(PBS_dataset_quest_cc_hruT2$T2speech_ther_visits_all)
table(PBS_dataset_quest_cc_hruT2$T2speech_ther_visits_all)
#therapist aggregated
hist(PBS_dataset_quest_cc_hruT2$T2therapist_visits)
summary(PBS_dataset_quest_cc_hruT2$T2therapist_visits)
table(PBS_dataset_quest_cc_hruT2$T2therapist_visits)

#consider also removing counsellor HRU since almost no visits recorded across all times (2,6,12 at T0, 1,26 at T1, and 0 at T2)
#update datasets and check again missingness patterns for updated cc HRU 

PBS_dataset_quest_cc_hruT0$T0couns_visits <- NULL
PBS_dataset_quest_cc_hruT1$T1couns_visits <- NULL
PBS_dataset_quest_cc_hruT2$T2couns_visits <- NULL
PBS_dataset_quest_cc_hruT0$T0gpsurgery_visits <- NULL
PBS_dataset_quest_cc_hruT0$T0gphome_visits <- NULL
PBS_dataset_quest_cc_hruT0$T0gpphone_visits <- NULL
PBS_dataset_quest_cc_hruT0$T0comnurse_visits <- NULL
PBS_dataset_quest_cc_hruT0$T0psynurse_visits <- NULL
PBS_dataset_quest_cc_hruT0$T0ldnnurse_visits_all <- NULL
PBS_dataset_quest_cc_hruT0$T0occ_ther_visits_all <- NULL
PBS_dataset_quest_cc_hruT0$T0art_ther_visits_all <- NULL
PBS_dataset_quest_cc_hruT0$T0alt_ther_visits_all <- NULL
PBS_dataset_quest_cc_hruT0$T0speech_ther_visits_all <- NULL
PBS_dataset_quest_cc_hruT1$T1gpsurgery_visits <- NULL
PBS_dataset_quest_cc_hruT1$T1gphome_visits <- NULL
PBS_dataset_quest_cc_hruT1$T1gpphone_visits <- NULL
PBS_dataset_quest_cc_hruT1$T1comnurse_visits <- NULL
PBS_dataset_quest_cc_hruT1$T1psynurse_visits <- NULL
PBS_dataset_quest_cc_hruT1$T1ldnnurse_visits_all <- NULL
PBS_dataset_quest_cc_hruT1$T1occ_ther_visits_all <- NULL
PBS_dataset_quest_cc_hruT1$T1art_ther_visits_all <- NULL
PBS_dataset_quest_cc_hruT1$T1alt_ther_visits_all <- NULL
PBS_dataset_quest_cc_hruT1$T1speech_ther_visits_all <- NULL
PBS_dataset_quest_cc_hruT2$T2gpsurgery_visits <- NULL
PBS_dataset_quest_cc_hruT2$T2gphome_visits <- NULL
PBS_dataset_quest_cc_hruT2$T2gpphone_visits <- NULL
PBS_dataset_quest_cc_hruT2$T2comnurse_visits <- NULL
PBS_dataset_quest_cc_hruT2$T2psynurse_visits <- NULL
PBS_dataset_quest_cc_hruT2$T2ldnnurse_visits_all <- NULL
PBS_dataset_quest_cc_hruT2$T2occ_ther_visits_all <- NULL
PBS_dataset_quest_cc_hruT2$T2art_ther_visits_all <- NULL
PBS_dataset_quest_cc_hruT2$T2alt_ther_visits_all <- NULL
PBS_dataset_quest_cc_hruT2$T2speech_ther_visits_all <- NULL

#total of 9 service types at each time
#at T0 no individual with fully missing pattern and 10 partially observed patterns (1 or 2 service types)
#at T1 12 individuals with fully missing pattern and 10 partially observed patterns (1,4,5 or 7 service types)
#at T2 9 individuals with fully missing pattern and 8 partially observed patterns (1,2,4,6 or 7 service types)
md.pattern(PBS_dataset_quest_cc_hruT0)
md.pattern(PBS_dataset_quest_cc_hruT1)
md.pattern(PBS_dataset_quest_cc_hruT2)
aggr(PBS_dataset_quest_cc_hruT0, combined=FALSE, only.miss=TRUE, sortVars=TRUE)
aggr(PBS_dataset_quest_cc_hruT1, combined=FALSE, only.miss=TRUE, sortVars=TRUE)
aggr(PBS_dataset_quest_cc_hruT2, combined=FALSE, only.miss=TRUE, sortVars=TRUE)

#combine cc HRU datasets into a single longitudinal one to check overall missingness patterns
PBS_dataset_quest_cc_hru <- cbind.data.frame(PBS_dataset_quest_cc_hruT0,PBS_dataset_quest_cc_hruT1,PBS_dataset_quest_cc_hruT2)

#total of 9x3=27 service types
#85% fully observed (208/244), 15% partially missing (36/244) of which 2.9% dropout at T1 (7/244), 1.6% dropout at T2 (4/244)
md.pattern(PBS_dataset_quest_cc_hru)
aggr(PBS_dataset_quest_cc_hru, combined=FALSE, only.miss=TRUE, sortVars=TRUE)
md.pattern(PBS_dataset_quest_cc_hru)[,c(10,11,12,13,15,16,17,20,23)]

#check presence of structural zeros and non-structural zeros for each type of HRU across all time points (always zero when observed or only sometimes)
#psydr
S0_psydr_visits_index <- which(PBS_dataset_quest_cc_hru$T0psydr_visits==0 & PBS_dataset_quest_cc_hru$T1psydr_visits==0 & PBS_dataset_quest_cc_hru$T2psydr_visits==0)
S0_psydr_visits_df <- PBS_dataset_quest_cc_hru[S0_psydr_visits_index,]
dim(S0_psydr_visits_df)[1]
noS0_psydr_visits_df <- PBS_dataset_quest_cc_hru[-S0_psydr_visits_index,]
sum(noS0_psydr_visits_df$T0psydr_visits==0, na.rm = TRUE)
sum(noS0_psydr_visits_df$T1psydr_visits==0, na.rm = TRUE)
sum(noS0_psydr_visits_df$T2psydr_visits==0, na.rm = TRUE)
#psych
S0_psych_visits_index <- which(PBS_dataset_quest_cc_hru$T0psych_visits==0 & PBS_dataset_quest_cc_hru$T1psych_visits==0 & PBS_dataset_quest_cc_hru$T2psych_visits==0)
S0_psych_visits_df <- PBS_dataset_quest_cc_hru[S0_psych_visits_index,]
dim(S0_psych_visits_df)[1]
noS0_psych_visits_df <- PBS_dataset_quest_cc_hru[-S0_psych_visits_index,]
sum(noS0_psych_visits_df$T0psych_visits==0, na.rm = TRUE)
sum(noS0_psych_visits_df$T1psych_visits==0, na.rm = TRUE)
sum(noS0_psych_visits_df$T2psych_visits==0, na.rm = TRUE)
#physio
S0_physio_visits_index <- which(PBS_dataset_quest_cc_hru$T0physio_visits==0 & PBS_dataset_quest_cc_hru$T1physio_visits==0 & PBS_dataset_quest_cc_hru$T2physio_visits==0)
S0_physio_visits_df <- PBS_dataset_quest_cc_hru[S0_physio_visits_index,]
dim(S0_physio_visits_df)[1]
noS0_physio_visits_df <- PBS_dataset_quest_cc_hru[-S0_physio_visits_index,]
sum(noS0_physio_visits_df$T0physio_visits==0, na.rm = TRUE)
sum(noS0_physio_visits_df$T1physio_visits==0, na.rm = TRUE)
sum(noS0_physio_visits_df$T2physio_visits==0, na.rm = TRUE)
#dentist
S0_dentist_visits_index <- which(PBS_dataset_quest_cc_hru$T0dentist_visits==0 & PBS_dataset_quest_cc_hru$T1dentist_visits==0 & PBS_dataset_quest_cc_hru$T2dentist_visits==0)
S0_dentist_visits_df <- PBS_dataset_quest_cc_hru[S0_dentist_visits_index,]
dim(S0_dentist_visits_df)[1]
noS0_dentist_visits_df <- PBS_dataset_quest_cc_hru[-S0_dentist_visits_index,]
sum(noS0_dentist_visits_df$T0dentist_visits==0, na.rm = TRUE)
sum(noS0_dentist_visits_df$T1dentist_visits==0, na.rm = TRUE)
sum(noS0_dentist_visits_df$T2dentist_visits==0, na.rm = TRUE)
#socialwork
S0_socialwork_visits_index <- which(PBS_dataset_quest_cc_hru$T0socialwork_visits_all==0 & PBS_dataset_quest_cc_hru$T1socialwork_visits_all==0 & PBS_dataset_quest_cc_hru$T2socialwork_visits_all==0)
S0_socialwork_visits_df <- PBS_dataset_quest_cc_hru[S0_socialwork_visits_index,]
dim(S0_socialwork_visits_df)[1]
noS0_socialwork_visits_df <- PBS_dataset_quest_cc_hru[-S0_socialwork_visits_index,]
sum(noS0_socialwork_visits_df$T0socialwork_visits_all==0, na.rm = TRUE)
sum(noS0_socialwork_visits_df$T1socialwork_visits_all==0, na.rm = TRUE)
sum(noS0_socialwork_visits_df$T2socialwork_visits_all==0, na.rm = TRUE)
#comwork
S0_comwork_visits_index <- which(PBS_dataset_quest_cc_hru$T0comwork_visits_all==0 & PBS_dataset_quest_cc_hru$T1comwork_visits_all==0 & PBS_dataset_quest_cc_hru$T2comwork_visits_all==0)
S0_comwork_visits_df <- PBS_dataset_quest_cc_hru[S0_comwork_visits_index,]
dim(S0_comwork_visits_df)[1]
noS0_comwork_visits_df <- PBS_dataset_quest_cc_hru[-S0_comwork_visits_index,]
sum(noS0_comwork_visits_df$T0comwork_visits_all==0, na.rm = TRUE)
sum(noS0_comwork_visits_df$T1comwork_visits_all==0, na.rm = TRUE)
sum(noS0_comwork_visits_df$T2comwork_visits_all==0, na.rm = TRUE)
#gp
S0_gp_visits_index <- which(PBS_dataset_quest_cc_hru$T0gp_visits==0 & PBS_dataset_quest_cc_hru$T1gp_visits==0 & PBS_dataset_quest_cc_hru$T2gp_visits==0)
S0_gp_visits_df <- PBS_dataset_quest_cc_hru[S0_gp_visits_index,]
dim(S0_gp_visits_df)[1]
noS0_gp_visits_df <- PBS_dataset_quest_cc_hru[-S0_gp_visits_index,]
sum(noS0_gp_visits_df$T0gp_visits==0, na.rm = TRUE)
sum(noS0_gp_visits_df$T1gp_visits==0, na.rm = TRUE)
sum(noS0_gp_visits_df$T2gp_visits==0, na.rm = TRUE)
#nurse
S0_nurse_visits_index <- which(PBS_dataset_quest_cc_hru$T0nurse_visits==0 & PBS_dataset_quest_cc_hru$T1nurse_visits==0 & PBS_dataset_quest_cc_hru$T2nurse_visits==0)
S0_nurse_visits_df <- PBS_dataset_quest_cc_hru[S0_nurse_visits_index,]
dim(S0_nurse_visits_df)[1]
noS0_nurse_visits_df <- PBS_dataset_quest_cc_hru[-S0_nurse_visits_index,]
sum(noS0_nurse_visits_df$T0nurse_visits==0, na.rm = TRUE)
sum(noS0_nurse_visits_df$T1nurse_visits==0, na.rm = TRUE)
sum(noS0_nurse_visits_df$T2nurse_visits==0, na.rm = TRUE)
#therapist
S0_therapist_visits_index <- which(PBS_dataset_quest_cc_hru$T0therapist_visits==0 & PBS_dataset_quest_cc_hru$T1therapist_visits==0 & PBS_dataset_quest_cc_hru$T2therapist_visits==0)
S0_therapist_visits_df <- PBS_dataset_quest_cc_hru[S0_therapist_visits_index,]
dim(S0_therapist_visits_df)[1]
noS0_therapist_visits_df <- PBS_dataset_quest_cc_hru[-S0_therapist_visits_index,]
sum(noS0_therapist_visits_df$T0therapist_visits==0, na.rm = TRUE)
sum(noS0_therapist_visits_df$T1therapist_visits==0, na.rm = TRUE)
sum(noS0_therapist_visits_df$T2therapist_visits==0, na.rm = TRUE)

#create indicator variables to denote presence (1=yes,0=no) of structural zeros at HRU level for each type
PBS_dataset_quest_cc_hru$psydr_visits_S0d <- ifelse(PBS_dataset_quest_cc_hru$T0psydr_visits==0 & PBS_dataset_quest_cc_hru$T1psydr_visits==0 & PBS_dataset_quest_cc_hru$T2psydr_visits==0,1,0)
PBS_dataset_quest_cc_hru$psych_visits_S0d <- ifelse(PBS_dataset_quest_cc_hru$T0psych_visits==0 & PBS_dataset_quest_cc_hru$T1psych_visits==0 & PBS_dataset_quest_cc_hru$T2psych_visits==0,1,0)
PBS_dataset_quest_cc_hru$physio_visits_S0d <- ifelse(PBS_dataset_quest_cc_hru$T0physio_visits==0 & PBS_dataset_quest_cc_hru$T1physio_visits==0 & PBS_dataset_quest_cc_hru$T2physio_visits==0,1,0)
PBS_dataset_quest_cc_hru$dentist_visits_S0d <- ifelse(PBS_dataset_quest_cc_hru$T0dentist_visits==0 & PBS_dataset_quest_cc_hru$T1dentist_visits==0 & PBS_dataset_quest_cc_hru$T2dentist_visits==0,1,0)
PBS_dataset_quest_cc_hru$socialwork_visits_S0d <- ifelse(PBS_dataset_quest_cc_hru$T0socialwork_visits_all==0 & PBS_dataset_quest_cc_hru$T1socialwork_visits_all==0 & PBS_dataset_quest_cc_hru$T2socialwork_visits_all==0,1,0)
PBS_dataset_quest_cc_hru$comwork_visits_S0d <- ifelse(PBS_dataset_quest_cc_hru$T0comwork_visits_all==0 & PBS_dataset_quest_cc_hru$T1comwork_visits_all==0 & PBS_dataset_quest_cc_hru$T2comwork_visits_all==0,1,0)
PBS_dataset_quest_cc_hru$gp_visits_S0d <- ifelse(PBS_dataset_quest_cc_hru$T0gp_visits==0 & PBS_dataset_quest_cc_hru$T1gp_visits==0 & PBS_dataset_quest_cc_hru$T2gp_visits==0,1,0)
PBS_dataset_quest_cc_hru$nurse_visits_S0d <- ifelse(PBS_dataset_quest_cc_hru$T0nurse_visits==0 & PBS_dataset_quest_cc_hru$T1nurse_visits==0 & PBS_dataset_quest_cc_hru$T2nurse_visits==0,1,0)
PBS_dataset_quest_cc_hru$therapist_visits_S0d <- ifelse(PBS_dataset_quest_cc_hru$T0therapist_visits==0 & PBS_dataset_quest_cc_hru$T1therapist_visits==0 & PBS_dataset_quest_cc_hru$T2therapist_visits==0,1,0)

#modelling idea by comparing analysis done based on:

#1)Aggregated total costs: cross-sectional variable
#TCs are computed for each individual by multiplying the corresponding unit price to each HRU variable 
#to generate costs for each HRU type at each time point. Next, each cost component is summed up to obtain a total cost
#variable at each time point. Finally, TCs are computed by summing up each total cost variable across times.
#using this approach missing HRU values are treated as missing if fully unobserved for each HRU type or imputed ad-hoc as zero
#if only missing for some HRU type at each time point. In addition, if total costs at a given time are not observed, the resulting
#TC across the trial will also be missing regardless of whether the variables were observed at other time points (unless some ad-hoc imputations are done)

#2)Disaggregated total costs: time-specific variables
#TCs at each time are computed using the same approach as before but now variables obtained at each time are not summed up 
#but rather modelled within a longitudinal data setting
#using this approach same problem as before with regard to missing partial observations at HRU level but advantage is that
#total costs observed at only some time points will be retained into the model and not discarded in order to compute the total aggregated TC variable

#3)Disaggregated HRU: HRU-specific and time-specific variables
#rates of adoption for each type of HRU at each time are computed using dedicated models to capture the nature of the data (discrete)
#while also modelling the longitudinal structure of the data 
#using this approach no missing value at HRU level is discarded or assumed ad-hoc to be zero since modelling requires specification
#of assumptions about any unobserved HRU values at each time. Cost values for each type of HRU retrieved by applying unit price to 
#corresponding rate of HRU adoption estimated from the model and then summed up at each time first, and then across times to generate 
#the TCs variable (in theory could do the same by first applying unit price and modelling cost component at each time but complexity of 
#data features for each cost component makes it difficult to model such variables using standard continuous distributions - e.g. spike at zero, limited number of observed unique values)

####################################################################################################

#1)Aggregated total costs: cross-sectional variable
#put together all aggregated data 

PBS_dataset_quest_cc_hru_AD <- data.frame(PBS_dataset_quest$pid,PBS_dataset_quest$site.x,PBS_dataset_quest$group.x)
names(PBS_dataset_quest_cc_hru_AD) <- c("pid","site","group")
#compute total health care costs at each time
AG_C0 <- PBS_dataset_quest$T0psydr_visits*39 + PBS_dataset_quest$T0psych_visits*52 + PBS_dataset_quest$T0physio_visits*52 +
  PBS_dataset_quest$T0dentist_visits*71 + PBS_dataset_quest$T0socialwork_visits*55 + PBS_dataset_quest$T0comwork_visits*51 +
  PBS_dataset_quest_cc_hru$T0gp_visits*((33+68+20)/3) + PBS_dataset_quest_cc_hru$T0nurse_visits*((39+17.5+17.5)/3) + PBS_dataset_quest_cc_hru$T0therapist_visits*((33+68+85+84)/4)

AG_C1 <- PBS_dataset_quest$T1psydr_visits*39 + PBS_dataset_quest$T1psych_visits*52 + PBS_dataset_quest$T1physio_visits*52 +
  PBS_dataset_quest$T1dentist_visits*71 + PBS_dataset_quest$T1socialwork_visits*55 + PBS_dataset_quest$T1comwork_visits*51 +
  PBS_dataset_quest_cc_hru$T1gp_visits*((33+68+21)/3) + PBS_dataset_quest_cc_hru$T1nurse_visits*((39+17.5+17.5)/3) + PBS_dataset_quest_cc_hru$T1therapist_visits*((33+68+85+84)/4)

AG_C2 <- PBS_dataset_quest$T2psydr_visits*39 + PBS_dataset_quest$T2psych_visits*52 + PBS_dataset_quest$T2physio_visits*52 +
  PBS_dataset_quest$T2dentist_visits*71 + PBS_dataset_quest$T2socialwork_visits*55 + PBS_dataset_quest$T2comwork_visits*51 +
  PBS_dataset_quest_cc_hru$T2gp_visits*((33+68+22)/3) + PBS_dataset_quest_cc_hru$T2nurse_visits*((39+17.5+17.5)/3) + PBS_dataset_quest_cc_hru$T2therapist_visits*((33+68+85+84)/4)

#assume HRU missing at time j if fully missing at that time / else treat it as 0 if only partially missing at that time

AG_C0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) | is.na(PBS_dataset_quest$T0psych_visits) | is.na(PBS_dataset_quest$T0physio_visits) |
                is.na(PBS_dataset_quest$T0dentist_visits) | is.na(PBS_dataset_quest$T0socialwork_visits) | is.na(PBS_dataset_quest$T0comwork_visits) |
                is.na(PBS_dataset_quest_cc_hru$T0gp_visits) | is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), 0, AG_C0)
AG_C0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) & is.na(PBS_dataset_quest$T0psych_visits) & is.na(PBS_dataset_quest$T0physio_visits) &
                      is.na(PBS_dataset_quest$T0dentist_visits) & is.na(PBS_dataset_quest$T0socialwork_visits) & is.na(PBS_dataset_quest$T0comwork_visits) &
                      is.na(PBS_dataset_quest_cc_hru$T0gp_visits) & is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), NA, AG_C0_imp)

AG_C1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) | is.na(PBS_dataset_quest$T1psych_visits) | is.na(PBS_dataset_quest$T1physio_visits) |
                      is.na(PBS_dataset_quest$T1dentist_visits) | is.na(PBS_dataset_quest$T1socialwork_visits) | is.na(PBS_dataset_quest$T1comwork_visits) |
                      is.na(PBS_dataset_quest_cc_hru$T1gp_visits) | is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), 1, AG_C1)
AG_C1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) & is.na(PBS_dataset_quest$T1psych_visits) & is.na(PBS_dataset_quest$T1physio_visits) &
                      is.na(PBS_dataset_quest$T1dentist_visits) & is.na(PBS_dataset_quest$T1socialwork_visits) & is.na(PBS_dataset_quest$T1comwork_visits) &
                      is.na(PBS_dataset_quest_cc_hru$T1gp_visits) & is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), NA, AG_C1_imp)

AG_C2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) | is.na(PBS_dataset_quest$T2psych_visits) | is.na(PBS_dataset_quest$T2physio_visits) |
                      is.na(PBS_dataset_quest$T2dentist_visits) | is.na(PBS_dataset_quest$T2socialwork_visits) | is.na(PBS_dataset_quest$T2comwork_visits) |
                      is.na(PBS_dataset_quest_cc_hru$T2gp_visits) | is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), 2, AG_C2)
AG_C2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) & is.na(PBS_dataset_quest$T2psych_visits) & is.na(PBS_dataset_quest$T2physio_visits) &
                      is.na(PBS_dataset_quest$T2dentist_visits) & is.na(PBS_dataset_quest$T2socialwork_visits) & is.na(PBS_dataset_quest$T2comwork_visits) &
                      is.na(PBS_dataset_quest_cc_hru$T2gp_visits) & is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), NA, AG_C2_imp)

PBS_dataset_quest_cc_hru_AD$AG_C0 <- AG_C0
PBS_dataset_quest_cc_hru_AD$AG_C1 <- AG_C1
PBS_dataset_quest_cc_hru_AD$AG_C2 <- AG_C2
PBS_dataset_quest_cc_hru_AD$AG_C0_imp <- AG_C0_imp
PBS_dataset_quest_cc_hru_AD$AG_C1_imp <- AG_C1_imp
PBS_dataset_quest_cc_hru_AD$AG_C2_imp <- AG_C2_imp

#compute overall total costs (sum of follow-up costs at each time - assume 0 if partially observed or leave missing if totally missing)
#M1) never impute NAs
PBS_dataset_quest_cc_hru_AD$AG_TC <- PBS_dataset_quest_cc_hru_AD$AG_C1 + PBS_dataset_quest_cc_hru_AD$AG_C2
#M2) impute as 0 the NAs in partially-missing HRU but not in total costs at time j
PBS_dataset_quest_cc_hru_AD$AG_TC_imp <- PBS_dataset_quest_cc_hru_AD$AG_C1_imp + PBS_dataset_quest_cc_hru_AD$AG_C2_imp
#impute as 0 the NAs in partially-missing total costs at time j>0 but not in HRU
PBS_dataset_quest_cc_hru_AD$AG_TC_imp_v2 <- ifelse(is.na(PBS_dataset_quest_cc_hru_AD$AG_C1) | is.na(PBS_dataset_quest_cc_hru_AD$AG_C2),0,PBS_dataset_quest_cc_hru_AD$AG_TC)
PBS_dataset_quest_cc_hru_AD$AG_TC_imp_v2 <- ifelse(is.na(PBS_dataset_quest_cc_hru_AD$AG_C1) & is.na(PBS_dataset_quest_cc_hru_AD$AG_C2),NA,PBS_dataset_quest_cc_hru_AD$AG_TC_imp_v2)
#M3) impute as 0 the NAs in partially-missing HRU and in total costs at time j>0
PBS_dataset_quest_cc_hru_AD$AG_TC_imp_imp <- ifelse(is.na(PBS_dataset_quest_cc_hru_AD$AG_C1_imp) | is.na(PBS_dataset_quest_cc_hru_AD$AG_C2_imp),0,PBS_dataset_quest_cc_hru_AD$AG_TC_imp)
PBS_dataset_quest_cc_hru_AD$AG_TC_imp_imp <- ifelse(is.na(PBS_dataset_quest_cc_hru_AD$AG_C1_imp) & is.na(PBS_dataset_quest_cc_hru_AD$AG_C2_imp),NA,PBS_dataset_quest_cc_hru_AD$AG_TC_imp_imp)

#add other baseline variables (age,gender and two-factors differing between groups - ethnicity and accommodation)

PBS_dataset_quest_cc_hru_AD$age <- PBS_dataset_quest$age.x
PBS_dataset_quest_cc_hru_AD$gender <- as.character(PBS_dataset_quest$gender.x)
PBS_dataset_quest_cc_hru_AD$ethnicity <- as.character(PBS_dataset_quest$ethnicity.x)
PBS_dataset_quest_cc_hru_AD$accomodation <-  as.character(PBS_dataset_quest$accomodation.x)
#recode ethn and accomm as binary to simplify
PBS_dataset_quest_cc_hru_AD$gender_d <- ifelse(PBS_dataset_quest_cc_hru_AD$gender == "Male",1,0)
PBS_dataset_quest_cc_hru_AD$ethnicity_d <- ifelse(PBS_dataset_quest_cc_hru_AD$ethnicity %in% c("White - British","White - Any other White background","White - Irish"),1,0)
PBS_dataset_quest_cc_hru_AD$accomodation_d <- ifelse(PBS_dataset_quest_cc_hru_AD$accomodation %in% c("Residential, 24-hour staffed","Supported living, individual single tenancy, 24-hour staffed","Supported living, individual single tenancy, not 24-hour staffed","Supported living, group living, 24-hour staffed"),1,0)


#pre-process data for fitting model in JAGS
################################################ version 1 - never impute NAs

N <- length(PBS_dataset_quest_cc_hru_AD$pid)
AG_TC <- PBS_dataset_quest_cc_hru_AD$AG_TC/1000
group <- PBS_dataset_quest_cc_hru_AD$group
TC_0 <- PBS_dataset_quest_cc_hru_AD$AG_C0/1000
hist(AG_TC[group==0])
summary(AG_TC[group==0])
hist(TC_0[group==0])
summary(TC_0[group==0])
hist(AG_TC[group==1])
summary(AG_TC[group==1])
hist(TC_0[group==1])
summary(TC_0[group==1])
#check fit of standard distributions to observed data for AG_TC and TC_0 (since missing values in both)
library(fitdistrplus)
plotdist(AG_TC[complete.cases(AG_TC)], histo = TRUE, demp = TRUE)
descdist(AG_TC[complete.cases(AG_TC)], boot = 1000)
fw <- fitdist(AG_TC[complete.cases(AG_TC)], "weibull")
fg <- fitdist(AG_TC[complete.cases(AG_TC)], "gamma")
fln <- fitdist(AG_TC[complete.cases(AG_TC)], "lnorm")
fn <- fitdist(AG_TC[complete.cases(AG_TC)], "norm")
summary(fw)
summary(fg)
summary(fln)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Weibull","gamma","lognormal", "normal")
denscomp(list(fw, fg, fln, fn), legendtext = plot.legend)
qqcomp(list(fw, fg, fln, fn), legendtext = plot.legend)
cdfcomp(list(fw, fg, fln, fn), legendtext = plot.legend)
ppcomp(list(fw, fg, fln, fn), legendtext = plot.legend)
#add small constant to TC_0 to avoid 0
plotdist(TC_0[complete.cases(TC_0)], histo = TRUE, demp = TRUE)
descdist(TC_0[complete.cases(TC_0)], boot = 1000)
fw <- fitdist(TC_0[complete.cases(TC_0)]+0.01, "weibull")
fg <- fitdist(TC_0[complete.cases(TC_0)]+0.01, "gamma")
fln <- fitdist(TC_0[complete.cases(TC_0)]+0.01, "lnorm")
fn <- fitdist(TC_0[complete.cases(TC_0)]+0.01, "norm")
summary(fw)
summary(fg)
summary(fln)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Weibull","gamma", "lognormal", "normal")
denscomp(list(fw, fg, fln, fn), legendtext = plot.legend)
qqcomp(list(fw, fg,fln, fn), legendtext = plot.legend)
cdfcomp(list(fw, fg,fln, fn), legendtext = plot.legend)
ppcomp(list(fw, fg, fln, fn), legendtext = plot.legend)
#set up JAGS information and fit models and compare fit (normal, lognormal, gamma)
TC_0 <- TC_0 + 0.01

library(R2jags)
set.seed(2345)
datalist<-list("AG_TC","TC_0","N","group")
inits1 <- list(.RNG.name = "base::Wichmann-Hill", .RNG.seed = 1)
inits2 <- list(.RNG.name = "base::Wichmann-Hill", .RNG.seed = 2)
params<-c("alpha0","alpha1","alpha2","mu_TC","sd_TC","sd_TC0","mu_TC0","tau_TC","log_lik_TC")

filein<-"AG_TC_model_norm_v1.txt"
n.iter<-20000
jagsModel_norm<-jags(data=datalist,inits=list(inits1,inits2),parameters.to.save=params,model.file=filein,
                n.chains=2,n.iter=n.iter,n.thin=1)
filein<-"AG_TC_model_lnorm_v1.txt"
n.iter<-20000
jagsModel_lnorm<-jags(data=datalist,inits=list(inits1,inits2),parameters.to.save=params,model.file=filein,
                     n.chains=2,n.iter=n.iter,n.thin=1)
filein<-"AG_TC_model_gamma_v1.txt"
n.iter<-20000
jagsModel_gamma<-jags(data=datalist,inits=list(inits1,inits2),parameters.to.save=params,model.file=filein,
                      n.chains=2,n.iter=n.iter,n.thin=1)
#data for joint model
EQ5D0 <- PBS_dataset_quest$eq5d0_proxy
EQ5D1 <- PBS_dataset_quest$eq5d1_proxy
EQ5D2 <- PBS_dataset_quest$eq5d2_proxy
QALY <- (EQ5D0+EQ5D1)*0.5/2 + (EQ5D1+EQ5D2)*0.5/2
datalist<-list("AG_TC","TC_0","N","group","EQ5D0","QALY")
params<-c("alpha0","alpha1","alpha2","mu_TC","sd_TC","sd_TC0","mu_TC0","tau_TC",
          "beta0_QALY","beta1_QALY","beta2_QALY","beta3_QALY","mu_QALY","sd_QALY",
          "mu_EQ5D0","sd_EQ5D0","beta0_EQ5D0","beta1_EQ5D0")
filein<-"AG_TC_model_gamma_v1_final.txt"
n.iter<-20000
jagsModel_gamma_final<-jags(data=datalist,inits=list(inits1,inits2),parameters.to.save=params,model.file=filein,
                      n.chains=2,n.iter=n.iter,n.thin=1)

#check model convergence
library(mcmcplots)
mcmcplot(jagsModel_norm, parms = "alpha1", style = "plain")
mcmcplot(jagsModel_lnorm, parms = "alpha1", style = "plain")
mcmcplot(jagsModel_gamma, parms = "alpha1", style = "plain")
library(ggmcmc)
library(mcmcr)
jagsModel2_mcmcobject <- coda::as.mcmc(jagsModel_norm)
jagsModel2_mcmcobject <- coda::as.mcmc(jagsModel_lnorm)
jagsModel2_mcmcobject <- coda::as.mcmc(jagsModel_gamma)
jagsModel2_mcmcsubset <- subset(jagsModel2_mcmcobject, pars = params)
jagsModel2_ggmcmc_object <- ggmcmc::ggs(jagsModel2_mcmcsubset)
ggmcmc::ggs_histogram(jagsModel2_ggmcmc_object, family = "alpha1")
ggmcmc::ggs_density(jagsModel2_ggmcmc_object, family = "alpha1")
ggmcmc::ggs_traceplot(jagsModel2_ggmcmc_object, family = "alpha1")
ggmcmc::ggs_autocorrelation(jagsModel2_ggmcmc_object, family = "alpha1")
ggmcmc::ggs_Rhat(jagsModel2_ggmcmc_object, family = "alpha1")
ggmcmc::ggs_caterpillar(jagsModel2_ggmcmc_object,family="alpha1")

res_s1_method1 <- readRDS("res_s1_method1.rds")
jagsModel_norm <- res_s1_method1$res_s1_method1_norm$jagsModel_norm
jagsModel_lnorm <- res_s1_method1$res_s1_method1_lnorm$jagsModel_lnorm
jagsModel_gamma <- res_s1_method1$res_s1_method1_gamma$jagsModel_gamma

#compare model fit via IC and PPC
library(loo)
log_lik_TC_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_TC
ic_waic_norm <- waic(log_lik_TC_norm)
ic_looic_norm <- loo(log_lik_TC_norm)

log_lik_TC_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$log_lik_TC
ic_waic_lnorm <- waic(log_lik_TC_lnorm)
ic_looic_lnorm <- loo(log_lik_TC_lnorm)

log_lik_TC_gamma <- jagsModel_gamma$BUGSoutput$sims.list$log_lik_TC
ic_waic_gamma <- waic(log_lik_TC_gamma)
ic_looic_gamma <- loo(log_lik_TC_gamma)

#compare PPC between models using plots of replicated vs observed data (histograms, densities, ecdf)
library(bayesplot)
#generate replicated data for each model
AG_TC_g0 <- AG_TC[group==0]
AG_TC_g1 <- AG_TC[group==1]
AG_TC_g0_obs <- AG_TC_g0[complete.cases(AG_TC_g0)]
AG_TC_g1_obs <- AG_TC_g1[complete.cases(AG_TC_g1)]
mu_tc_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_TC[,is.na(AG_TC)==FALSE & group==0]
mu_tc_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_TC[,is.na(AG_TC)==FALSE & group==1]
sd_tc_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_TC[,1]
sd_tc_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_TC[,2]
AG_TC_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_tc_obs_g0_norm)[2])
AG_TC_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_tc_obs_g1_norm)[2])
set.seed(8361299)
for(i in 1:jagsModel_norm$n.iter){
    AG_TC_obs_g0_rep_norm[i,] <- rnorm(dim(mu_tc_obs_g0_norm)[2], mu_tc_obs_g0_norm[i,], sd_tc_obs_g0_norm[i])
    AG_TC_obs_g1_rep_norm[i,] <- rnorm(dim(mu_tc_obs_g1_norm)[2], mu_tc_obs_g1_norm[i,], sd_tc_obs_g1_norm[i])
}
mu_tc_obs_g0_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$mu_TC[,is.na(AG_TC)==FALSE & group==0]
mu_tc_obs_g1_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$mu_TC[,is.na(AG_TC)==FALSE & group==1]
sd_tc_obs_g0_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$sd_TC[,1]
sd_tc_obs_g1_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$sd_TC[,2]
AG_TC_obs_g0_rep_lnorm <- matrix(NA, nrow = jagsModel_lnorm$n.iter, ncol = dim(mu_tc_obs_g0_lnorm)[2])
AG_TC_obs_g1_rep_lnorm <- matrix(NA, nrow = jagsModel_lnorm$n.iter, ncol = dim(mu_tc_obs_g1_lnorm)[2])
set.seed(8361299)
for(i in 1:jagsModel_lnorm$n.iter){
  AG_TC_obs_g0_rep_lnorm[i,] <- rlnorm(dim(mu_tc_obs_g0_lnorm)[2], mu_tc_obs_g0_lnorm[i,], sd_tc_obs_g0_lnorm[i])
  AG_TC_obs_g1_rep_lnorm[i,] <- rlnorm(dim(mu_tc_obs_g1_lnorm)[2], mu_tc_obs_g1_lnorm[i,], sd_tc_obs_g1_lnorm[i])
}
mu_tc_obs_g0_gamma <- jagsModel_gamma$BUGSoutput$sims.list$mu_TC[,is.na(AG_TC)==FALSE & group==0]
mu_tc_obs_g1_gamma <- jagsModel_gamma$BUGSoutput$sims.list$mu_TC[,is.na(AG_TC)==FALSE & group==1]
tau_tc_obs_g0_gamma <- jagsModel_gamma$BUGSoutput$sims.list$tau_TC[,is.na(AG_TC)==FALSE & group==0]
tau_tc_obs_g1_gamma <- jagsModel_gamma$BUGSoutput$sims.list$tau_TC[,is.na(AG_TC)==FALSE & group==1]
AG_TC_obs_g0_rep_gamma <- matrix(NA, nrow = jagsModel_gamma$n.iter, ncol = dim(mu_tc_obs_g0_gamma)[2])
AG_TC_obs_g1_rep_gamma <- matrix(NA, nrow = jagsModel_gamma$n.iter, ncol = dim(mu_tc_obs_g1_gamma)[2])
set.seed(8361299)
for(i in 1:jagsModel_gamma$n.iter){
  AG_TC_obs_g0_rep_gamma[i,] <- rgamma(dim(mu_tc_obs_g0_gamma)[2], shape=mu_tc_obs_g0_gamma[i,]*tau_tc_obs_g0_gamma[i,], rate=tau_tc_obs_g0_gamma[i,])
  AG_TC_obs_g1_rep_gamma[i,] <- rgamma(dim(mu_tc_obs_g1_gamma)[2], shape=mu_tc_obs_g1_gamma[i,]*tau_tc_obs_g1_gamma[i,], rate=tau_tc_obs_g1_gamma[i,])
}

#draw plots
color_scheme_set("red")
ppc_dens_overlay(AG_TC_g0_obs,AG_TC_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(AG_TC_g0_obs,AG_TC_obs_g0_rep_norm[1:25,])
ppc_hist(AG_TC_g0_obs,AG_TC_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(AG_TC_g0_obs,AG_TC_obs_g0_rep_lnorm[1:25,], bw=0.25)
ppc_ecdf_overlay(AG_TC_g0_obs,AG_TC_obs_g0_rep_lnorm[1:25,])
ppc_hist(AG_TC_g0_obs,AG_TC_obs_g0_rep_lnorm[1:15,])
ppc_dens_overlay(AG_TC_g0_obs,AG_TC_obs_g0_rep_gamma[1:25,], bw=0.25)
ppc_ecdf_overlay(AG_TC_g0_obs,AG_TC_obs_g0_rep_gamma[1:25,])
ppc_hist(AG_TC_g0_obs,AG_TC_obs_g0_rep_gamma[1:15,])
color_scheme_set("blue")
ppc_dens_overlay(AG_TC_g1_obs,AG_TC_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(AG_TC_g1_obs,AG_TC_obs_g1_rep_norm[1:25,])
ppc_hist(AG_TC_g1_obs,AG_TC_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(AG_TC_g1_obs,AG_TC_obs_g1_rep_lnorm[1:25,], bw=0.25)
ppc_ecdf_overlay(AG_TC_g1_obs,AG_TC_obs_g1_rep_lnorm[1:25,])
ppc_hist(AG_TC_g1_obs,AG_TC_obs_g1_rep_lnorm[1:15,])
ppc_dens_overlay(AG_TC_g1_obs,AG_TC_obs_g1_rep_gamma[1:25,], bw=0.25)
ppc_ecdf_overlay(AG_TC_g1_obs,AG_TC_obs_g1_rep_gamma[1:25,])
ppc_hist(AG_TC_g1_obs,AG_TC_obs_g1_rep_gamma[1:15,])
#generate posterior means by MC 
set.seed(8361299)
L <- 10000
#approximate marginal mean outcome per group from each model
mu_tc_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_TC[,group==0]
mu_tc_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_TC[,group==1]
sd_tc_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_TC[,1]
sd_tc_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_TC[,2]
mmu_tc_g0_norm <- mmu_tc_g1_norm <- c()
for(i in 1:jagsModel_norm$n.iter){
    mmu_tc_g0_norm[i] <- mean(rnorm(L, mu_tc_g0_norm[i,], sd_tc_g0_norm[i]))
    mmu_tc_g1_norm[i] <- mean(rnorm(L, mu_tc_g1_norm[i,], sd_tc_g1_norm[i]))
}
set.seed(8361299)
mu_tc_g0_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$mu_TC[,group==0]
mu_tc_g1_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$mu_TC[,group==1]
sd_tc_g0_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$sd_TC[,1]
sd_tc_g1_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$sd_TC[,2]
mmu_tc_g0_lnorm <- mmu_tc_g1_lnorm <- c()
for(i in 1:jagsModel_lnorm$n.iter){
    mmu_tc_g0_lnorm[i] <- mean(rlnorm(L, mu_tc_g0_lnorm[i,], sd_tc_g0_lnorm[i]))
    mmu_tc_g1_lnorm[i] <- mean(rlnorm(L, mu_tc_g1_lnorm[i,], sd_tc_g1_lnorm[i]))
}
set.seed(8361299)
mu_tc_g0_gamma <- jagsModel_gamma$BUGSoutput$sims.list$mu_TC[,group==0]
mu_tc_g1_gamma <- jagsModel_gamma$BUGSoutput$sims.list$mu_TC[,group==1]
tau_tc_g0_gamma <- jagsModel_gamma$BUGSoutput$sims.list$tau_TC[,group==0]
tau_tc_g1_gamma <- jagsModel_gamma$BUGSoutput$sims.list$tau_TC[,group==1]
mmu_tc_g0_gamma <- mmu_tc_g1_gamma <- c()
for(i in 1:jagsModel_gamma$n.iter){
  mmu_tc_g0_gamma[i] <- mean(rgamma(L, shape=mu_tc_g0_gamma[i,]*tau_tc_g0_gamma[i,], rate=tau_tc_g0_gamma[i,]))
  mmu_tc_g1_gamma[i] <- mean(rgamma(L, shape=mu_tc_g1_gamma[i,]*tau_tc_g1_gamma[i,], rate=tau_tc_g1_gamma[i,]))
}

#generate posterior means by MC (final joint model)
set.seed(8361299)
L <- 10000
#approximate marginal mean outcome per group from each model
mu_qaly_g0_norm <- jagsModel_gamma_final$BUGSoutput$sims.list$mu_QALY[,group==0]
mu_qaly_g1_norm <- jagsModel_gamma_final$BUGSoutput$sims.list$mu_QALY[,group==1]
sd_qaly_g0_norm <- jagsModel_gamma_final$BUGSoutput$sims.list$sd_QALY
sd_qaly_g1_norm <- jagsModel_gamma_final$BUGSoutput$sims.list$sd_QALY
mmu_qaly_g0_norm <- mmu_qaly_g1_norm <- c()
for(i in 1:jagsModel_gamma_final$n.iter){
  mmu_qaly_g0_norm[i] <- mean(rnorm(L, mu_qaly_g0_norm[i,], sd_qaly_g0_norm[i]))
  mmu_qaly_g1_norm[i] <- mean(rnorm(L, mu_qaly_g1_norm[i,], sd_qaly_g1_norm[i]))
}
set.seed(8361299)
mu_tc_g0_gamma <- jagsModel_gamma_final$BUGSoutput$sims.list$mu_TC[,group==0]
mu_tc_g1_gamma <- jagsModel_gamma_final$BUGSoutput$sims.list$mu_TC[,group==1]
tau_tc_g0_gamma <- jagsModel_gamma_final$BUGSoutput$sims.list$tau_TC[,group==0]
tau_tc_g1_gamma <- jagsModel_gamma_final$BUGSoutput$sims.list$tau_TC[,group==1]
mmu_tc_g0_gamma <- mmu_tc_g1_gamma <- c()
for(i in 1:jagsModel_gamma_final$n.iter){
  mmu_tc_g0_gamma[i] <- mean(rgamma(L, shape=mu_tc_g0_gamma[i,]*tau_tc_g0_gamma[i,], rate=tau_tc_g0_gamma[i,]))
  mmu_tc_g1_gamma[i] <- mean(rgamma(L, shape=mu_tc_g1_gamma[i,]*tau_tc_g1_gamma[i,], rate=tau_tc_g1_gamma[i,]))
}

#compare mean results (obtain results on original scale by *1000)
library(HDInterval)
hist(mmu_tc_g0_norm*1000)
summary(mmu_tc_g0_norm*1000)
hist(mmu_tc_g1_norm*1000)
summary(mmu_tc_g1_norm*1000)
delta_tc_norm <- mmu_tc_g1_norm*1000 - mmu_tc_g0_norm*1000
hist(delta_tc_norm)
summary(delta_tc_norm)
c(mean(delta_tc_norm),hdi(delta_tc_norm, credMass = 0.95))

hist(mmu_tc_g0_lnorm*1000)
summary(mmu_tc_g0_lnorm*1000)
hist(mmu_tc_g1_lnorm*1000)
summary(mmu_tc_g1_lnorm*1000)
delta_tc_lnorm <- mmu_tc_g1_lnorm*1000 - mmu_tc_g0_lnorm*1000
hist(delta_tc_lnorm)
summary(delta_tc_lnorm)
c(mean(delta_tc_lnorm),hdi(delta_tc_lnorm, credMass = 0.95))

hist(mmu_tc_g0_gamma*1000)
summary(mmu_tc_g0_gamma*1000)
hist(mmu_tc_g1_gamma*1000)
summary(mmu_tc_g1_gamma*1000)
delta_tc_gamma <- mmu_tc_g1_gamma*1000 - mmu_tc_g0_gamma*1000
hist(delta_tc_gamma)
summary(delta_tc_gamma)
c(mean(delta_tc_gamma),hdi(delta_tc_gamma, credMass = 0.95))

#final joint model
hist(mmu_qaly_g0_norm*1000)
summary(mmu_qaly_g0_norm*1000)
hist(mmu_qaly_g1_norm*1000)
summary(mmu_qaly_g1_norm*1000)
delta_qaly_norm <- mmu_qaly_g1_norm - mmu_qaly_g0_norm
hist(delta_qaly_norm)
summary(delta_qaly_norm)
c(mean(delta_qaly_norm),hdi(delta_qaly_norm, credMass = 0.95))

hist(mmu_tc_g0_gamma*1000)
summary(mmu_tc_g0_gamma*1000)
hist(mmu_tc_g1_gamma*1000)
summary(mmu_tc_g1_gamma*1000)
delta_tc_gamma <- mmu_tc_g1_gamma*1000 - mmu_tc_g0_gamma*1000
hist(delta_tc_gamma)
summary(delta_tc_gamma)
c(mean(delta_tc_gamma),hdi(delta_tc_gamma, credMass = 0.95))


#store results
res_s1_method1_norm <- list("jagsModel_norm"=jagsModel_norm,
                            "ic_waic_norm"=ic_waic_norm, "ic_looic_norm"=ic_waic_norm,
                            "AG_TC_g0_obs"=AG_TC_g0_obs, "AG_TC_g1_obs"=AG_TC_g1_obs,
                            "AG_TC_obs_g0_rep_norm"=AG_TC_obs_g0_rep_norm, "AG_TC_obs_g1_rep_norm"=AG_TC_obs_g1_rep_norm,
                            "mmu_tc_g0_norm"=mmu_tc_g0_norm,"mmu_tc_g1_norm"=mmu_tc_g1_norm,
                            "delta_tc_norm"=delta_tc_norm)
res_s1_method1_lnorm <- list("jagsModel_lnorm"=jagsModel_lnorm,
                             "ic_waic_lnorm"=ic_waic_lnorm, "ic_looic_lnorm"=ic_waic_lnorm,
                             "AG_TC_g0_obs"=AG_TC_g0_obs, "AG_TC_g1_obs"=AG_TC_g1_obs,
                             "AG_TC_obs_g0_rep_lnorm"=AG_TC_obs_g0_rep_lnorm, "AG_TC_obs_g1_rep_lnorm"=AG_TC_obs_g1_rep_lnorm,
                             "mmu_tc_g0_lnorm"=mmu_tc_g0_lnorm,"mmu_tc_g1_lnorm"=mmu_tc_g1_lnorm,
                             "delta_tc_lnorm"=delta_tc_lnorm)
res_s1_method1_gamma <- list("jagsModel_gamma"=jagsModel_gamma,
                            "ic_waic_gamma"=ic_waic_gamma, "ic_looic_gamma"=ic_waic_gamma,
                            "AG_TC_g0_obs"=AG_TC_g0_obs, "AG_TC_g1_obs"=AG_TC_g1_obs,
                            "AG_TC_obs_g0_rep_gamma"=AG_TC_obs_g0_rep_gamma, "AG_TC_obs_g1_rep_gamma"=AG_TC_obs_g1_rep_gamma,
                            "mmu_tc_g0_gamma"=mmu_tc_g0_gamma,"mmu_tc_g1_gamma"=mmu_tc_g1_gamma,
                            "delta_tc_gamma"=delta_tc_gamma)
res_s1_method1 <- list("res_s1_method1_norm"=res_s1_method1_norm,
                       "res_s1_method1_lnorm"=res_s1_method1_lnorm,
                       "res_s1_method1_gamma"=res_s1_method1_gamma)
#saveRDS(res_s1_method1,"res_s1_method1.rds")

#final joint model
res_s1_method1_gamma_final <- list("jagsModel_gamma_final"=jagsModel_gamma_final,
                             "mmu_tc_g0_gamma"=mmu_tc_g0_gamma,"mmu_tc_g1_gamma"=mmu_tc_g1_gamma,
                             "delta_tc_gamma"=delta_tc_gamma, "mmu_qaly_g0_norm"=mmu_qaly_g0_norm,
                             "mmu_qaly_g1_norm"=mmu_qaly_g1_norm, "delta_qaly_norm"=delta_qaly_norm)
#saveRDS(res_s1_method1_gamma_final,"res_s1_method1_gamma_final.rds")




################################################ version 2 - impute NAs in HRU as 0 (partially-observed) but leave NAs in TCj

N <- length(PBS_dataset_quest_cc_hru_AD$pid)
AG_TC <- PBS_dataset_quest_cc_hru_AD$AG_TC_imp/1000
group <- PBS_dataset_quest_cc_hru_AD$group
TC_0 <- PBS_dataset_quest_cc_hru_AD$AG_C0_imp/1000
hist(AG_TC[group==0])
summary(AG_TC[group==0])
hist(TC_0[group==0])
summary(TC_0[group==0])
hist(AG_TC[group==1])
summary(AG_TC[group==1])
hist(TC_0[group==1])
summary(TC_0[group==1])
#check fit of standard distributions to observed data for AG_TC (since missing values only in AG_TC)
library(fitdistrplus)
plotdist(AG_TC[complete.cases(AG_TC)], histo = TRUE, demp = TRUE)
descdist(AG_TC[complete.cases(AG_TC)], boot = 1000)
fw <- fitdist(AG_TC[complete.cases(AG_TC)], "weibull")
fg <- fitdist(AG_TC[complete.cases(AG_TC)], "gamma")
fln <- fitdist(AG_TC[complete.cases(AG_TC)], "lnorm")
fn <- fitdist(AG_TC[complete.cases(AG_TC)], "norm")
summary(fw)
summary(fg)
summary(fln)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Weibull","gamma","lognormal", "normal")
denscomp(list(fw, fg, fln, fn), legendtext = plot.legend)
qqcomp(list(fw, fg, fln, fn), legendtext = plot.legend)
cdfcomp(list(fw, fg, fln, fn), legendtext = plot.legend)
ppcomp(list(fw, fg, fln, fn), legendtext = plot.legend)
#set up JAGS information and fit models and compare fit (normal, lognormal, gamma)
#since no NAs in TC0, then no need to specify model for TC0 but treated as observed covariate
library(R2jags)
set.seed(2345)
datalist<-list("AG_TC","TC_0","N","group")
inits1 <- list(.RNG.name = "base::Wichmann-Hill", .RNG.seed = 1)
inits2 <- list(.RNG.name = "base::Wichmann-Hill", .RNG.seed = 2)
params<-c("alpha0","alpha1","alpha2","mu_TC","sd_TC","tau_TC","log_lik_TC")
filein<-"AG_TC_model_norm_v2.txt"
n.iter<-20000
jagsModel_norm<-jags(data=datalist,inits=list(inits1,inits2),parameters.to.save=params,model.file=filein,
                     n.chains=2,n.iter=n.iter,n.thin=1)
filein<-"AG_TC_model_lnorm_v2.txt"
n.iter<-20000
jagsModel_lnorm<-jags(data=datalist,inits=list(inits1,inits2),parameters.to.save=params,model.file=filein,
                      n.chains=2,n.iter=n.iter,n.thin=1)
filein<-"AG_TC_model_gamma_v2.txt"
n.iter<-20000
jagsModel_gamma<-jags(data=datalist,inits=list(inits1,inits2),parameters.to.save=params,model.file=filein,
                      n.chains=2,n.iter=n.iter,n.thin=1)

#data for joint model
EQ5D0 <- PBS_dataset_quest$eq5d0_proxy
EQ5D1 <- PBS_dataset_quest$eq5d1_proxy
EQ5D2 <- PBS_dataset_quest$eq5d2_proxy
QALY <- (EQ5D0+EQ5D1)*0.5/2 + (EQ5D1+EQ5D2)*0.5/2
datalist<-list("AG_TC","TC_0","N","group","EQ5D0","QALY")
params<-c("alpha0","alpha1","alpha2","mu_TC","sd_TC","tau_TC",
          "beta0_QALY","beta1_QALY","beta2_QALY","beta3_QALY","mu_QALY","sd_QALY",
          "mu_EQ5D0","sd_EQ5D0","beta0_EQ5D0","beta1_EQ5D0")
filein<-"AG_TC_model_gamma_v2_final.txt"
n.iter<-20000
jagsModel_gamma_final<-jags(data=datalist,inits=list(inits1,inits2),parameters.to.save=params,model.file=filein,
                            n.chains=2,n.iter=n.iter,n.thin=1)


#check model convergence
library(mcmcplots)
mcmcplot(jagsModel_norm, parms = "alpha1", style = "plain")
mcmcplot(jagsModel_lnorm, parms = "alpha1", style = "plain")
mcmcplot(jagsModel_gamma, parms = "alpha1", style = "plain")
library(ggmcmc)
library(mcmcr)
jagsModel2_mcmcobject <- coda::as.mcmc(jagsModel_norm)
jagsModel2_mcmcobject <- coda::as.mcmc(jagsModel_lnorm)
jagsModel2_mcmcobject <- coda::as.mcmc(jagsModel_gamma)
jagsModel2_mcmcsubset <- subset(jagsModel2_mcmcobject, pars = params)
jagsModel2_ggmcmc_object <- ggmcmc::ggs(jagsModel2_mcmcsubset)
ggmcmc::ggs_histogram(jagsModel2_ggmcmc_object, family = "alpha1")
ggmcmc::ggs_density(jagsModel2_ggmcmc_object, family = "alpha1")
ggmcmc::ggs_traceplot(jagsModel2_ggmcmc_object, family = "alpha1")
ggmcmc::ggs_autocorrelation(jagsModel2_ggmcmc_object, family = "alpha1")
ggmcmc::ggs_Rhat(jagsModel2_ggmcmc_object, family = "alpha1")
ggmcmc::ggs_caterpillar(jagsModel2_ggmcmc_object,family="alpha1")

#compare model fit via IC and PPC
library(loo)
log_lik_TC_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_TC
ic_waic_norm <- waic(log_lik_TC_norm)
ic_looic_norm <- loo(log_lik_TC_norm)

log_lik_TC_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$log_lik_TC
ic_waic_lnorm <- waic(log_lik_TC_lnorm)
ic_looic_lnorm <- loo(log_lik_TC_lnorm)

log_lik_TC_gamma <- jagsModel_gamma$BUGSoutput$sims.list$log_lik_TC
ic_waic_gamma <- waic(log_lik_TC_gamma)
ic_looic_gamma <- loo(log_lik_TC_gamma)

#compare PPC between models using plots of replicated vs observed data (histograms, densities, ecdf)
library(bayesplot)
#generate replicated data for each model
AG_TC_g0 <- AG_TC[group==0]
AG_TC_g1 <- AG_TC[group==1]
AG_TC_g0_obs <- AG_TC_g0[complete.cases(AG_TC_g0)]
AG_TC_g1_obs <- AG_TC_g1[complete.cases(AG_TC_g1)]
mu_tc_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_TC[,is.na(AG_TC)==FALSE & group==0]
mu_tc_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_TC[,is.na(AG_TC)==FALSE & group==1]
sd_tc_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_TC[,1]
sd_tc_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_TC[,2]
AG_TC_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_tc_obs_g0_norm)[2])
AG_TC_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_tc_obs_g1_norm)[2])
set.seed(8361299)
for(i in 1:jagsModel_norm$n.iter){
  AG_TC_obs_g0_rep_norm[i,] <- rnorm(dim(mu_tc_obs_g0_norm)[2], mu_tc_obs_g0_norm[i,], sd_tc_obs_g0_norm[i])
  AG_TC_obs_g1_rep_norm[i,] <- rnorm(dim(mu_tc_obs_g1_norm)[2], mu_tc_obs_g1_norm[i,], sd_tc_obs_g1_norm[i])
}
mu_tc_obs_g0_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$mu_TC[,is.na(AG_TC)==FALSE & group==0]
mu_tc_obs_g1_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$mu_TC[,is.na(AG_TC)==FALSE & group==1]
sd_tc_obs_g0_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$sd_TC[,1]
sd_tc_obs_g1_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$sd_TC[,2]
AG_TC_obs_g0_rep_lnorm <- matrix(NA, nrow = jagsModel_lnorm$n.iter, ncol = dim(mu_tc_obs_g0_lnorm)[2])
AG_TC_obs_g1_rep_lnorm <- matrix(NA, nrow = jagsModel_lnorm$n.iter, ncol = dim(mu_tc_obs_g1_lnorm)[2])
set.seed(8361299)
for(i in 1:jagsModel_lnorm$n.iter){
  AG_TC_obs_g0_rep_lnorm[i,] <- rlnorm(dim(mu_tc_obs_g0_lnorm)[2], mu_tc_obs_g0_lnorm[i,], sd_tc_obs_g0_lnorm[i])
  AG_TC_obs_g1_rep_lnorm[i,] <- rlnorm(dim(mu_tc_obs_g1_lnorm)[2], mu_tc_obs_g1_lnorm[i,], sd_tc_obs_g1_lnorm[i])
}
mu_tc_obs_g0_gamma <- jagsModel_gamma$BUGSoutput$sims.list$mu_TC[,is.na(AG_TC)==FALSE & group==0]
mu_tc_obs_g1_gamma <- jagsModel_gamma$BUGSoutput$sims.list$mu_TC[,is.na(AG_TC)==FALSE & group==1]
tau_tc_obs_g0_gamma <- jagsModel_gamma$BUGSoutput$sims.list$tau_TC[,is.na(AG_TC)==FALSE & group==0]
tau_tc_obs_g1_gamma <- jagsModel_gamma$BUGSoutput$sims.list$tau_TC[,is.na(AG_TC)==FALSE & group==1]
AG_TC_obs_g0_rep_gamma <- matrix(NA, nrow = jagsModel_gamma$n.iter, ncol = dim(mu_tc_obs_g0_gamma)[2])
AG_TC_obs_g1_rep_gamma <- matrix(NA, nrow = jagsModel_gamma$n.iter, ncol = dim(mu_tc_obs_g1_gamma)[2])
set.seed(8361299)
for(i in 1:jagsModel_gamma$n.iter){
  AG_TC_obs_g0_rep_gamma[i,] <- rgamma(dim(mu_tc_obs_g0_gamma)[2], shape=mu_tc_obs_g0_gamma[i,]*tau_tc_obs_g0_gamma[i,], rate=tau_tc_obs_g0_gamma[i,])
  AG_TC_obs_g1_rep_gamma[i,] <- rgamma(dim(mu_tc_obs_g1_gamma)[2], shape=mu_tc_obs_g1_gamma[i,]*tau_tc_obs_g1_gamma[i,], rate=tau_tc_obs_g1_gamma[i,])
}

#draw plots
color_scheme_set("red")
ppc_dens_overlay(AG_TC_g0_obs,AG_TC_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(AG_TC_g0_obs,AG_TC_obs_g0_rep_norm[1:25,])
ppc_hist(AG_TC_g0_obs,AG_TC_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(AG_TC_g0_obs,AG_TC_obs_g0_rep_lnorm[1:25,], bw=0.25)
ppc_ecdf_overlay(AG_TC_g0_obs,AG_TC_obs_g0_rep_lnorm[1:25,])
ppc_hist(AG_TC_g0_obs,AG_TC_obs_g0_rep_lnorm[1:15,])
ppc_dens_overlay(AG_TC_g0_obs,AG_TC_obs_g0_rep_gamma[1:25,], bw=0.25)
ppc_ecdf_overlay(AG_TC_g0_obs,AG_TC_obs_g0_rep_gamma[1:25,])
ppc_hist(AG_TC_g0_obs,AG_TC_obs_g0_rep_gamma[1:15,])
color_scheme_set("blue")
ppc_dens_overlay(AG_TC_g1_obs,AG_TC_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(AG_TC_g1_obs,AG_TC_obs_g1_rep_norm[1:25,])
ppc_hist(AG_TC_g1_obs,AG_TC_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(AG_TC_g1_obs,AG_TC_obs_g1_rep_lnorm[1:25,], bw=0.25)
ppc_ecdf_overlay(AG_TC_g1_obs,AG_TC_obs_g1_rep_lnorm[1:25,])
ppc_hist(AG_TC_g1_obs,AG_TC_obs_g1_rep_lnorm[1:15,])
ppc_dens_overlay(AG_TC_g1_obs,AG_TC_obs_g1_rep_gamma[1:25,], bw=0.25)
ppc_ecdf_overlay(AG_TC_g1_obs,AG_TC_obs_g1_rep_gamma[1:25,])
ppc_hist(AG_TC_g1_obs,AG_TC_obs_g1_rep_gamma[1:15,])
#generate posterior means by MC 
set.seed(8361299)
L <- 10000
#approximate marginal mean outcome per group from each model
mu_tc_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_TC[,group==0]
mu_tc_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_TC[,group==1]
sd_tc_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_TC[,1]
sd_tc_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_TC[,2]
mmu_tc_g0_norm <- mmu_tc_g1_norm <- c()
for(i in 1:jagsModel_norm$n.iter){
  mmu_tc_g0_norm[i] <- mean(rnorm(L, mu_tc_g0_norm[i,], sd_tc_g0_norm[i]))
  mmu_tc_g1_norm[i] <- mean(rnorm(L, mu_tc_g1_norm[i,], sd_tc_g1_norm[i]))
}
set.seed(8361299)
mu_tc_g0_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$mu_TC[,group==0]
mu_tc_g1_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$mu_TC[,group==1]
sd_tc_g0_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$sd_TC[,1]
sd_tc_g1_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$sd_TC[,2]
mmu_tc_g0_lnorm <- mmu_tc_g1_lnorm <- c()
for(i in 1:jagsModel_lnorm$n.iter){
  mmu_tc_g0_lnorm[i] <- mean(rlnorm(L, mu_tc_g0_lnorm[i,], sd_tc_g0_lnorm[i]))
  mmu_tc_g1_lnorm[i] <- mean(rlnorm(L, mu_tc_g1_lnorm[i,], sd_tc_g1_lnorm[i]))
}
set.seed(8361299)
mu_tc_g0_gamma <- jagsModel_gamma$BUGSoutput$sims.list$mu_TC[,group==0]
mu_tc_g1_gamma <- jagsModel_gamma$BUGSoutput$sims.list$mu_TC[,group==1]
tau_tc_g0_gamma <- jagsModel_gamma$BUGSoutput$sims.list$tau_TC[,group==0]
tau_tc_g1_gamma <- jagsModel_gamma$BUGSoutput$sims.list$tau_TC[,group==1]
mmu_tc_g0_gamma <- mmu_tc_g1_gamma <- c()
for(i in 1:jagsModel_gamma$n.iter){
  mmu_tc_g0_gamma[i] <- mean(rgamma(L, shape=mu_tc_g0_gamma[i,]*tau_tc_g0_gamma[i,], rate=tau_tc_g0_gamma[i,]))
  mmu_tc_g1_gamma[i] <- mean(rgamma(L, shape=mu_tc_g1_gamma[i,]*tau_tc_g1_gamma[i,], rate=tau_tc_g1_gamma[i,]))
}

#generate posterior means by MC (final joint model)
set.seed(8361299)
L <- 10000
#approximate marginal mean outcome per group from each model
mu_qaly_g0_norm <- jagsModel_gamma_final$BUGSoutput$sims.list$mu_QALY[,group==0]
mu_qaly_g1_norm <- jagsModel_gamma_final$BUGSoutput$sims.list$mu_QALY[,group==1]
sd_qaly_g0_norm <- jagsModel_gamma_final$BUGSoutput$sims.list$sd_QALY
sd_qaly_g1_norm <- jagsModel_gamma_final$BUGSoutput$sims.list$sd_QALY
mmu_qaly_g0_norm <- mmu_qaly_g1_norm <- c()
for(i in 1:jagsModel_gamma_final$n.iter){
  mmu_qaly_g0_norm[i] <- mean(rnorm(L, mu_qaly_g0_norm[i,], sd_qaly_g0_norm[i]))
  mmu_qaly_g1_norm[i] <- mean(rnorm(L, mu_qaly_g1_norm[i,], sd_qaly_g1_norm[i]))
}
set.seed(8361299)
mu_tc_g0_gamma <- jagsModel_gamma_final$BUGSoutput$sims.list$mu_TC[,group==0]
mu_tc_g1_gamma <- jagsModel_gamma_final$BUGSoutput$sims.list$mu_TC[,group==1]
tau_tc_g0_gamma <- jagsModel_gamma_final$BUGSoutput$sims.list$tau_TC[,group==0]
tau_tc_g1_gamma <- jagsModel_gamma_final$BUGSoutput$sims.list$tau_TC[,group==1]
mmu_tc_g0_gamma <- mmu_tc_g1_gamma <- c()
for(i in 1:jagsModel_gamma_final$n.iter){
  mmu_tc_g0_gamma[i] <- mean(rgamma(L, shape=mu_tc_g0_gamma[i,]*tau_tc_g0_gamma[i,], rate=tau_tc_g0_gamma[i,]))
  mmu_tc_g1_gamma[i] <- mean(rgamma(L, shape=mu_tc_g1_gamma[i,]*tau_tc_g1_gamma[i,], rate=tau_tc_g1_gamma[i,]))
}


#compare mean results (obtain results on original scale by *1000)
library(HDInterval)
hist(mmu_tc_g0_norm*1000)
summary(mmu_tc_g0_norm*1000)
hist(mmu_tc_g1_norm*1000)
summary(mmu_tc_g1_norm*1000)
delta_tc_norm <- mmu_tc_g1_norm*1000 - mmu_tc_g0_norm*1000
hist(delta_tc_norm)
summary(delta_tc_norm)
c(mean(delta_tc_norm),hdi(delta_tc_norm, credMass = 0.95))

hist(mmu_tc_g0_lnorm*1000)
summary(mmu_tc_g0_lnorm*1000)
hist(mmu_tc_g1_lnorm*1000)
summary(mmu_tc_g1_lnorm*1000)
delta_tc_lnorm <- mmu_tc_g1_lnorm*1000 - mmu_tc_g0_lnorm*1000
hist(delta_tc_lnorm)
summary(delta_tc_lnorm)
c(mean(delta_tc_lnorm),hdi(delta_tc_lnorm, credMass = 0.95))

hist(mmu_tc_g0_gamma*1000)
summary(mmu_tc_g0_gamma*1000)
hist(mmu_tc_g1_gamma*1000)
summary(mmu_tc_g1_gamma*1000)
delta_tc_gamma <- mmu_tc_g1_gamma*1000 - mmu_tc_g0_gamma*1000
hist(delta_tc_gamma)
summary(delta_tc_gamma)
c(mean(delta_tc_gamma),hdi(delta_tc_gamma, credMass = 0.95))

#final joint model
hist(mmu_qaly_g0_norm*1000)
summary(mmu_qaly_g0_norm*1000)
hist(mmu_qaly_g1_norm*1000)
summary(mmu_qaly_g1_norm*1000)
delta_qaly_norm <- mmu_qaly_g1_norm - mmu_qaly_g0_norm
hist(delta_qaly_norm)
summary(delta_qaly_norm)
c(mean(delta_qaly_norm),hdi(delta_qaly_norm, credMass = 0.95))

hist(mmu_tc_g0_gamma*1000)
summary(mmu_tc_g0_gamma*1000)
hist(mmu_tc_g1_gamma*1000)
summary(mmu_tc_g1_gamma*1000)
delta_tc_gamma <- mmu_tc_g1_gamma*1000 - mmu_tc_g0_gamma*1000
hist(delta_tc_gamma)
summary(delta_tc_gamma)
c(mean(delta_tc_gamma),hdi(delta_tc_gamma, credMass = 0.95))

#store results
res_s1_method2_norm <- list("jagsModel_norm"=jagsModel_norm,
                            "ic_waic_norm"=ic_waic_norm, "ic_looic_norm"=ic_waic_norm,
                            "AG_TC_g0_obs"=AG_TC_g0_obs, "AG_TC_g1_obs"=AG_TC_g1_obs,
                            "AG_TC_obs_g0_rep_norm"=AG_TC_obs_g0_rep_norm, "AG_TC_obs_g1_rep_norm"=AG_TC_obs_g1_rep_norm,
                            "mmu_tc_g0_norm"=mmu_tc_g0_norm,"mmu_tc_g1_norm"=mmu_tc_g1_norm,
                            "delta_tc_norm"=delta_tc_norm)
res_s1_method2_lnorm <- list("jagsModel_lnorm"=jagsModel_lnorm,
                             "ic_waic_lnorm"=ic_waic_lnorm, "ic_looic_lnorm"=ic_waic_lnorm,
                             "AG_TC_g0_obs"=AG_TC_g0_obs, "AG_TC_g1_obs"=AG_TC_g1_obs,
                             "AG_TC_obs_g0_rep_lnorm"=AG_TC_obs_g0_rep_lnorm, "AG_TC_obs_g1_rep_lnorm"=AG_TC_obs_g1_rep_lnorm,
                             "mmu_tc_g0_lnorm"=mmu_tc_g0_lnorm,"mmu_tc_g1_lnorm"=mmu_tc_g1_lnorm,
                             "delta_tc_lnorm"=delta_tc_lnorm)
res_s1_method2_gamma <- list("jagsModel_gamma"=jagsModel_gamma,
                             "ic_waic_gamma"=ic_waic_gamma, "ic_looic_gamma"=ic_waic_gamma,
                             "AG_TC_g0_obs"=AG_TC_g0_obs, "AG_TC_g1_obs"=AG_TC_g1_obs,
                             "AG_TC_obs_g0_rep_gamma"=AG_TC_obs_g0_rep_gamma, "AG_TC_obs_g1_rep_gamma"=AG_TC_obs_g1_rep_gamma,
                             "mmu_tc_g0_gamma"=mmu_tc_g0_gamma,"mmu_tc_g1_gamma"=mmu_tc_g1_gamma,
                             "delta_tc_gamma"=delta_tc_gamma)
res_s1_method2 <- list("res_s1_method2_norm"=res_s1_method2_norm,
                       "res_s1_method2_lnorm"=res_s1_method2_lnorm,
                       "res_s1_method2_gamma"=res_s1_method2_gamma)
#saveRDS(res_s1_method2,"res_s1_method2.rds")

#final joint model
res_s1_method2_gamma_final <- list("jagsModel_gamma_final"=jagsModel_gamma_final,
                                   "mmu_tc_g0_gamma"=mmu_tc_g0_gamma,"mmu_tc_g1_gamma"=mmu_tc_g1_gamma,
                                   "delta_tc_gamma"=delta_tc_gamma, "mmu_qaly_g0_norm"=mmu_qaly_g0_norm,
                                   "mmu_qaly_g1_norm"=mmu_qaly_g1_norm, "delta_qaly_norm"=delta_qaly_norm)
#saveRDS(res_s1_method2_gamma_final,"res_s1_method2_gamma_final.rds")

################################################ version 3 - impute NAs in HRU and TCj as 0 (partially-observed)

N <- length(PBS_dataset_quest_cc_hru_AD$pid)
AG_TC <- PBS_dataset_quest_cc_hru_AD$AG_TC_imp_imp/1000
group <- PBS_dataset_quest_cc_hru_AD$group
TC_0 <- PBS_dataset_quest_cc_hru_AD$AG_C0_imp/1000
hist(AG_TC[group==0])
summary(AG_TC[group==0])
hist(TC_0[group==0])
summary(TC_0[group==0])
hist(AG_TC[group==1])
summary(AG_TC[group==1])
hist(TC_0[group==1])
summary(TC_0[group==1])
#check fit of standard distributions to observed data for AG_TC (since missing values only in AG_TC)
#add 0.01 to avoid 0 in AG_TC
library(fitdistrplus)
plotdist(AG_TC[complete.cases(AG_TC)+0.01], histo = TRUE, demp = TRUE)
descdist(AG_TC[complete.cases(AG_TC)+0.01], boot = 1000)
fw <- fitdist(AG_TC[complete.cases(AG_TC)+0.01], "weibull")
fg <- fitdist(AG_TC[complete.cases(AG_TC)+0.01], "gamma")
fln <- fitdist(AG_TC[complete.cases(AG_TC)+0.01], "lnorm")
fn <- fitdist(AG_TC[complete.cases(AG_TC)+0.01], "norm")
summary(fw)
summary(fg)
summary(fln)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Weibull","gamma","lognormal", "normal")
denscomp(list(fw, fg, fln, fn), legendtext = plot.legend)
qqcomp(list(fw, fg, fln, fn), legendtext = plot.legend)
cdfcomp(list(fw, fg, fln, fn), legendtext = plot.legend)
ppcomp(list(fw, fg, fln, fn), legendtext = plot.legend)
#set up JAGS information and fit models and compare fit (normal, lognormal, gamma)
#since no NAs in TC0, then no need to specify model for TC0 but treated as observed covariate
AG_TC <- AG_TC + 0.01
library(R2jags)
set.seed(2345)
datalist<-list("AG_TC","TC_0","N","group")
inits1 <- list(.RNG.name = "base::Wichmann-Hill", .RNG.seed = 1)
inits2 <- list(.RNG.name = "base::Wichmann-Hill", .RNG.seed = 2)
params<-c("alpha0","alpha1","alpha2","mu_TC","sd_TC","tau_TC","log_lik_TC")
filein<-"AG_TC_model_norm_v3.txt"
n.iter<-20000
jagsModel_norm<-jags(data=datalist,inits=list(inits1,inits2),parameters.to.save=params,model.file=filein,
                     n.chains=2,n.iter=n.iter,n.thin=1)
filein<-"AG_TC_model_lnorm_v3.txt"
n.iter<-20000
jagsModel_lnorm<-jags(data=datalist,inits=list(inits1,inits2),parameters.to.save=params,model.file=filein,
                      n.chains=2,n.iter=n.iter,n.thin=1)
filein<-"AG_TC_model_gamma_v3.txt"
n.iter<-20000
jagsModel_gamma<-jags(data=datalist,inits=list(inits1,inits2),parameters.to.save=params,model.file=filein,
                      n.chains=2,n.iter=n.iter,n.thin=1)

#data for joint model
EQ5D0 <- PBS_dataset_quest$eq5d0_proxy
EQ5D1 <- PBS_dataset_quest$eq5d1_proxy
EQ5D2 <- PBS_dataset_quest$eq5d2_proxy
QALY <- (EQ5D0+EQ5D1)*0.5/2 + (EQ5D1+EQ5D2)*0.5/2
datalist<-list("AG_TC","TC_0","N","group","EQ5D0","QALY")
params<-c("alpha0","alpha1","alpha2","mu_TC","sd_TC","tau_TC",
          "beta0_QALY","beta1_QALY","beta2_QALY","beta3_QALY","mu_QALY","sd_QALY",
          "mu_EQ5D0","sd_EQ5D0","beta0_EQ5D0","beta1_EQ5D0")
filein<-"AG_TC_model_gamma_v3_final.txt"
n.iter<-20000
jagsModel_gamma_final<-jags(data=datalist,inits=list(inits1,inits2),parameters.to.save=params,model.file=filein,
                            n.chains=2,n.iter=n.iter,n.thin=1)


#check model convergence
library(mcmcplots)
mcmcplot(jagsModel_norm, parms = "alpha1", style = "plain")
mcmcplot(jagsModel_lnorm, parms = "alpha1", style = "plain")
mcmcplot(jagsModel_gamma, parms = "alpha1", style = "plain")
library(ggmcmc)
library(mcmcr)
jagsModel2_mcmcobject <- coda::as.mcmc(jagsModel_norm)
jagsModel2_mcmcobject <- coda::as.mcmc(jagsModel_lnorm)
jagsModel2_mcmcobject <- coda::as.mcmc(jagsModel_gamma)
jagsModel2_mcmcsubset <- subset(jagsModel2_mcmcobject, pars = params)
jagsModel2_ggmcmc_object <- ggmcmc::ggs(jagsModel2_mcmcsubset)
ggmcmc::ggs_histogram(jagsModel2_ggmcmc_object, family = "alpha1")
ggmcmc::ggs_density(jagsModel2_ggmcmc_object, family = "alpha1")
ggmcmc::ggs_traceplot(jagsModel2_ggmcmc_object, family = "alpha1")
ggmcmc::ggs_autocorrelation(jagsModel2_ggmcmc_object, family = "alpha1")
ggmcmc::ggs_Rhat(jagsModel2_ggmcmc_object, family = "alpha1")
ggmcmc::ggs_caterpillar(jagsModel2_ggmcmc_object,family="alpha1")

#compare model fit via IC and PPC
library(loo)
log_lik_TC_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_TC
ic_waic_norm <- waic(log_lik_TC_norm)
ic_looic_norm <- loo(log_lik_TC_norm)

log_lik_TC_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$log_lik_TC
ic_waic_lnorm <- waic(log_lik_TC_lnorm)
ic_looic_lnorm <- loo(log_lik_TC_lnorm)

log_lik_TC_gamma <- jagsModel_gamma$BUGSoutput$sims.list$log_lik_TC
ic_waic_gamma <- waic(log_lik_TC_gamma)
ic_looic_gamma <- loo(log_lik_TC_gamma)

#compare PPC between models using plots of replicated vs observed data (histograms, densities, ecdf)
library(bayesplot)
#generate replicated data for each model
AG_TC_g0 <- AG_TC[group==0]
AG_TC_g1 <- AG_TC[group==1]
AG_TC_g0_obs <- AG_TC_g0[complete.cases(AG_TC_g0)]
AG_TC_g1_obs <- AG_TC_g1[complete.cases(AG_TC_g1)]
mu_tc_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_TC[,is.na(AG_TC)==FALSE & group==0]
mu_tc_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_TC[,is.na(AG_TC)==FALSE & group==1]
sd_tc_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_TC[,1]
sd_tc_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_TC[,2]
AG_TC_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_tc_obs_g0_norm)[2])
AG_TC_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_tc_obs_g1_norm)[2])
set.seed(8361299)
for(i in 1:jagsModel_norm$n.iter){
  AG_TC_obs_g0_rep_norm[i,] <- rnorm(dim(mu_tc_obs_g0_norm)[2], mu_tc_obs_g0_norm[i,], sd_tc_obs_g0_norm[i])
  AG_TC_obs_g1_rep_norm[i,] <- rnorm(dim(mu_tc_obs_g1_norm)[2], mu_tc_obs_g1_norm[i,], sd_tc_obs_g1_norm[i])
}
mu_tc_obs_g0_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$mu_TC[,is.na(AG_TC)==FALSE & group==0]
mu_tc_obs_g1_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$mu_TC[,is.na(AG_TC)==FALSE & group==1]
sd_tc_obs_g0_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$sd_TC[,1]
sd_tc_obs_g1_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$sd_TC[,2]
AG_TC_obs_g0_rep_lnorm <- matrix(NA, nrow = jagsModel_lnorm$n.iter, ncol = dim(mu_tc_obs_g0_lnorm)[2])
AG_TC_obs_g1_rep_lnorm <- matrix(NA, nrow = jagsModel_lnorm$n.iter, ncol = dim(mu_tc_obs_g1_lnorm)[2])
set.seed(8361299)
for(i in 1:jagsModel_lnorm$n.iter){
  AG_TC_obs_g0_rep_lnorm[i,] <- rlnorm(dim(mu_tc_obs_g0_lnorm)[2], mu_tc_obs_g0_lnorm[i,], sd_tc_obs_g0_lnorm[i])
  AG_TC_obs_g1_rep_lnorm[i,] <- rlnorm(dim(mu_tc_obs_g1_lnorm)[2], mu_tc_obs_g1_lnorm[i,], sd_tc_obs_g1_lnorm[i])
}
mu_tc_obs_g0_gamma <- jagsModel_gamma$BUGSoutput$sims.list$mu_TC[,is.na(AG_TC)==FALSE & group==0]
mu_tc_obs_g1_gamma <- jagsModel_gamma$BUGSoutput$sims.list$mu_TC[,is.na(AG_TC)==FALSE & group==1]
tau_tc_obs_g0_gamma <- jagsModel_gamma$BUGSoutput$sims.list$tau_TC[,is.na(AG_TC)==FALSE & group==0]
tau_tc_obs_g1_gamma <- jagsModel_gamma$BUGSoutput$sims.list$tau_TC[,is.na(AG_TC)==FALSE & group==1]
AG_TC_obs_g0_rep_gamma <- matrix(NA, nrow = jagsModel_gamma$n.iter, ncol = dim(mu_tc_obs_g0_gamma)[2])
AG_TC_obs_g1_rep_gamma <- matrix(NA, nrow = jagsModel_gamma$n.iter, ncol = dim(mu_tc_obs_g1_gamma)[2])
set.seed(8361299)
for(i in 1:jagsModel_gamma$n.iter){
  AG_TC_obs_g0_rep_gamma[i,] <- rgamma(dim(mu_tc_obs_g0_gamma)[2], shape=mu_tc_obs_g0_gamma[i,]*tau_tc_obs_g0_gamma[i,], rate=tau_tc_obs_g0_gamma[i,])
  AG_TC_obs_g1_rep_gamma[i,] <- rgamma(dim(mu_tc_obs_g1_gamma)[2], shape=mu_tc_obs_g1_gamma[i,]*tau_tc_obs_g1_gamma[i,], rate=tau_tc_obs_g1_gamma[i,])
}

#draw plots
color_scheme_set("red")
ppc_dens_overlay(AG_TC_g0_obs,AG_TC_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(AG_TC_g0_obs,AG_TC_obs_g0_rep_norm[1:25,])
ppc_hist(AG_TC_g0_obs,AG_TC_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(AG_TC_g0_obs,AG_TC_obs_g0_rep_lnorm[1:25,], bw=0.25)
ppc_ecdf_overlay(AG_TC_g0_obs,AG_TC_obs_g0_rep_lnorm[1:25,])
ppc_hist(AG_TC_g0_obs,AG_TC_obs_g0_rep_lnorm[1:15,])
ppc_dens_overlay(AG_TC_g0_obs,AG_TC_obs_g0_rep_gamma[1:25,], bw=0.25)
ppc_ecdf_overlay(AG_TC_g0_obs,AG_TC_obs_g0_rep_gamma[1:25,])
ppc_hist(AG_TC_g0_obs,AG_TC_obs_g0_rep_gamma[1:15,])
color_scheme_set("blue")
ppc_dens_overlay(AG_TC_g1_obs,AG_TC_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(AG_TC_g1_obs,AG_TC_obs_g1_rep_norm[1:25,])
ppc_hist(AG_TC_g1_obs,AG_TC_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(AG_TC_g1_obs,AG_TC_obs_g1_rep_lnorm[1:25,], bw=0.25)
ppc_ecdf_overlay(AG_TC_g1_obs,AG_TC_obs_g1_rep_lnorm[1:25,])
ppc_hist(AG_TC_g1_obs,AG_TC_obs_g1_rep_lnorm[1:15,])
ppc_dens_overlay(AG_TC_g1_obs,AG_TC_obs_g1_rep_gamma[1:25,], bw=0.25)
ppc_ecdf_overlay(AG_TC_g1_obs,AG_TC_obs_g1_rep_gamma[1:25,])
ppc_hist(AG_TC_g1_obs,AG_TC_obs_g1_rep_gamma[1:15,])
#generate posterior means by MC 
set.seed(8361299)
L <- 10000
#approximate marginal mean outcome per group from each model
mu_tc_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_TC[,group==0]
mu_tc_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_TC[,group==1]
sd_tc_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_TC[,1]
sd_tc_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_TC[,2]
mmu_tc_g0_norm <- mmu_tc_g1_norm <- c()
for(i in 1:jagsModel_norm$n.iter){
  mmu_tc_g0_norm[i] <- mean(rnorm(L, mu_tc_g0_norm[i,], sd_tc_g0_norm[i]))
  mmu_tc_g1_norm[i] <- mean(rnorm(L, mu_tc_g1_norm[i,], sd_tc_g1_norm[i]))
}
set.seed(8361299)
mu_tc_g0_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$mu_TC[,group==0]
mu_tc_g1_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$mu_TC[,group==1]
sd_tc_g0_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$sd_TC[,1]
sd_tc_g1_lnorm <- jagsModel_lnorm$BUGSoutput$sims.list$sd_TC[,2]
mmu_tc_g0_lnorm <- mmu_tc_g1_lnorm <- c()
for(i in 1:jagsModel_lnorm$n.iter){
  mmu_tc_g0_lnorm[i] <- mean(rlnorm(L, mu_tc_g0_lnorm[i,], sd_tc_g0_lnorm[i]))
  mmu_tc_g1_lnorm[i] <- mean(rlnorm(L, mu_tc_g1_lnorm[i,], sd_tc_g1_lnorm[i]))
}
set.seed(8361299)
mu_tc_g0_gamma <- jagsModel_gamma$BUGSoutput$sims.list$mu_TC[,group==0]
mu_tc_g1_gamma <- jagsModel_gamma$BUGSoutput$sims.list$mu_TC[,group==1]
tau_tc_g0_gamma <- jagsModel_gamma$BUGSoutput$sims.list$tau_TC[,group==0]
tau_tc_g1_gamma <- jagsModel_gamma$BUGSoutput$sims.list$tau_TC[,group==1]
mmu_tc_g0_gamma <- mmu_tc_g1_gamma <- c()
for(i in 1:jagsModel_gamma$n.iter){
  mmu_tc_g0_gamma[i] <- mean(rgamma(L, shape=mu_tc_g0_gamma[i,]*tau_tc_g0_gamma[i,], rate=tau_tc_g0_gamma[i,]))
  mmu_tc_g1_gamma[i] <- mean(rgamma(L, shape=mu_tc_g1_gamma[i,]*tau_tc_g1_gamma[i,], rate=tau_tc_g1_gamma[i,]))
}

#generate posterior means by MC (final joint model)
set.seed(8361299)
L <- 10000
#approximate marginal mean outcome per group from each model
mu_qaly_g0_norm <- jagsModel_gamma_final$BUGSoutput$sims.list$mu_QALY[,group==0]
mu_qaly_g1_norm <- jagsModel_gamma_final$BUGSoutput$sims.list$mu_QALY[,group==1]
sd_qaly_g0_norm <- jagsModel_gamma_final$BUGSoutput$sims.list$sd_QALY
sd_qaly_g1_norm <- jagsModel_gamma_final$BUGSoutput$sims.list$sd_QALY
mmu_qaly_g0_norm <- mmu_qaly_g1_norm <- c()
for(i in 1:jagsModel_gamma_final$n.iter){
  mmu_qaly_g0_norm[i] <- mean(rnorm(L, mu_qaly_g0_norm[i,], sd_qaly_g0_norm[i]))
  mmu_qaly_g1_norm[i] <- mean(rnorm(L, mu_qaly_g1_norm[i,], sd_qaly_g1_norm[i]))
}
set.seed(8361299)
mu_tc_g0_gamma <- jagsModel_gamma_final$BUGSoutput$sims.list$mu_TC[,group==0]
mu_tc_g1_gamma <- jagsModel_gamma_final$BUGSoutput$sims.list$mu_TC[,group==1]
tau_tc_g0_gamma <- jagsModel_gamma_final$BUGSoutput$sims.list$tau_TC[,group==0]
tau_tc_g1_gamma <- jagsModel_gamma_final$BUGSoutput$sims.list$tau_TC[,group==1]
mmu_tc_g0_gamma <- mmu_tc_g1_gamma <- c()
for(i in 1:jagsModel_gamma_final$n.iter){
  mmu_tc_g0_gamma[i] <- mean(rgamma(L, shape=mu_tc_g0_gamma[i,]*tau_tc_g0_gamma[i,], rate=tau_tc_g0_gamma[i,]))
  mmu_tc_g1_gamma[i] <- mean(rgamma(L, shape=mu_tc_g1_gamma[i,]*tau_tc_g1_gamma[i,], rate=tau_tc_g1_gamma[i,]))
}


#compare mean results (obtain results on original scale by *1000)
library(HDInterval)
library(ggplot2)

hist(mmu_tc_g0_norm*1000)
summary(mmu_tc_g0_norm*1000)
hist(mmu_tc_g1_norm*1000)
summary(mmu_tc_g1_norm*1000)
delta_tc_norm <- mmu_tc_g1_norm*1000 - mmu_tc_g0_norm*1000
hist(delta_tc_norm)
summary(delta_tc_norm)
c(mean(delta_tc_norm),hdi(delta_tc_norm, credMass = 0.95))

hist(mmu_tc_g0_lnorm*1000)
summary(mmu_tc_g0_lnorm*1000)
hist(mmu_tc_g1_lnorm*1000)
summary(mmu_tc_g1_lnorm*1000)
delta_tc_lnorm <- mmu_tc_g1_lnorm*1000 - mmu_tc_g0_lnorm*1000
hist(delta_tc_lnorm)
summary(delta_tc_lnorm)
c(mean(delta_tc_lnorm),hdi(delta_tc_lnorm, credMass = 0.95))

hist(mmu_tc_g0_gamma*1000)
summary(mmu_tc_g0_gamma*1000)
hist(mmu_tc_g1_gamma*1000)
summary(mmu_tc_g1_gamma*1000)
delta_tc_gamma <- mmu_tc_g1_gamma*1000 - mmu_tc_g0_gamma*1000
hist(delta_tc_gamma)
summary(delta_tc_gamma)
c(mean(delta_tc_gamma),hdi(delta_tc_gamma, credMass = 0.95))

#final joint model
hist(mmu_qaly_g0_norm*1000)
summary(mmu_qaly_g0_norm*1000)
hist(mmu_qaly_g1_norm*1000)
summary(mmu_qaly_g1_norm*1000)
delta_qaly_norm <- mmu_qaly_g1_norm - mmu_qaly_g0_norm
hist(delta_qaly_norm)
summary(delta_qaly_norm)
c(mean(delta_qaly_norm),hdi(delta_qaly_norm, credMass = 0.95))

hist(mmu_tc_g0_gamma*1000)
summary(mmu_tc_g0_gamma*1000)
hist(mmu_tc_g1_gamma*1000)
summary(mmu_tc_g1_gamma*1000)
delta_tc_gamma <- mmu_tc_g1_gamma*1000 - mmu_tc_g0_gamma*1000
hist(delta_tc_gamma)
summary(delta_tc_gamma)
c(mean(delta_tc_gamma),hdi(delta_tc_gamma, credMass = 0.95))

#store results
res_s1_method3_norm <- list("jagsModel_norm"=jagsModel_norm,
                            "ic_waic_norm"=ic_waic_norm, "ic_looic_norm"=ic_waic_norm,
                            "AG_TC_g0_obs"=AG_TC_g0_obs, "AG_TC_g1_obs"=AG_TC_g1_obs,
                            "AG_TC_obs_g0_rep_norm"=AG_TC_obs_g0_rep_norm, "AG_TC_obs_g1_rep_norm"=AG_TC_obs_g1_rep_norm,
                            "mmu_tc_g0_norm"=mmu_tc_g0_norm,"mmu_tc_g1_norm"=mmu_tc_g1_norm,
                            "delta_tc_norm"=delta_tc_norm)
res_s1_method3_lnorm <- list("jagsModel_lnorm"=jagsModel_lnorm,
                             "ic_waic_lnorm"=ic_waic_lnorm, "ic_looic_lnorm"=ic_waic_lnorm,
                             "AG_TC_g0_obs"=AG_TC_g0_obs, "AG_TC_g1_obs"=AG_TC_g1_obs,
                             "AG_TC_obs_g0_rep_lnorm"=AG_TC_obs_g0_rep_lnorm, "AG_TC_obs_g1_rep_lnorm"=AG_TC_obs_g1_rep_lnorm,
                             "mmu_tc_g0_lnorm"=mmu_tc_g0_lnorm,"mmu_tc_g1_lnorm"=mmu_tc_g1_lnorm,
                             "delta_tc_lnorm"=delta_tc_lnorm)
res_s1_method3_gamma <- list("jagsModel_gamma"=jagsModel_gamma,
                             "ic_waic_gamma"=ic_waic_gamma, "ic_looic_gamma"=ic_waic_gamma,
                             "AG_TC_g0_obs"=AG_TC_g0_obs, "AG_TC_g1_obs"=AG_TC_g1_obs,
                             "AG_TC_obs_g0_rep_gamma"=AG_TC_obs_g0_rep_gamma, "AG_TC_obs_g1_rep_gamma"=AG_TC_obs_g1_rep_gamma,
                             "mmu_tc_g0_gamma"=mmu_tc_g0_gamma,"mmu_tc_g1_gamma"=mmu_tc_g1_gamma,
                             "delta_tc_gamma"=delta_tc_gamma)
res_s1_method3 <- list("res_s1_method3_norm"=res_s1_method3_norm,
                       "res_s1_method3_lnorm"=res_s1_method3_lnorm,
                       "res_s1_method3_gamma"=res_s1_method3_gamma)
#saveRDS(res_s1_method3,"res_s1_method3.rds")

#final joint model
res_s1_method3_gamma_final <- list("jagsModel_gamma_final"=jagsModel_gamma_final,
                                   "mmu_tc_g0_gamma"=mmu_tc_g0_gamma,"mmu_tc_g1_gamma"=mmu_tc_g1_gamma,
                                   "delta_tc_gamma"=delta_tc_gamma, "mmu_qaly_g0_norm"=mmu_qaly_g0_norm,
                                   "mmu_qaly_g1_norm"=mmu_qaly_g1_norm, "delta_qaly_norm"=delta_qaly_norm)
#saveRDS(res_s1_method3_gamma_final,"res_s1_method3_gamma_final.rds")

#RESULTS - MODEL LEVEL OF QALYS/TCS
#load results and extract estimates
library(HDInterval)
res_s1_method1 <- readRDS("res_s1_method1.rds")
res_s1_method2 <- readRDS("res_s1_method2.rds")
res_s1_method3 <- readRDS("res_s1_method3.rds")

#m1 = remove all partially-observed HRU and time point cost data to construct TC
#amount missing resulting in TC
summary(PBS_dataset_quest_cc_hru_AD$AG_TC)
#check empirical distributions of TC by arm
hist(PBS_dataset_quest_cc_hru_AD$AG_TC[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$AG_TC[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$AG_TC[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$AG_TC[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$AG_TC~PBS_dataset_quest_cc_hru_AD$group)

s1m1_mu_tc0_gamma <- res_s1_method1$res_s1_method1_gamma$mmu_tc_g0_gamma*1000
s1m1_mu_tc1_gamma <- res_s1_method1$res_s1_method1_gamma$mmu_tc_g1_gamma*1000
s1m1_delta_tc_gamma <- s1m1_mu_tc1_gamma - s1m1_mu_tc0_gamma
c(mean(s1m1_mu_tc0_gamma),hdi(s1m1_mu_tc0_gamma, credMass = 0.95))
c(mean(s1m1_mu_tc1_gamma),hdi(s1m1_mu_tc1_gamma, credMass = 0.95))
c(mean(s1m1_delta_tc_gamma),hdi(s1m1_delta_tc_gamma, credMass = 0.95))
mean_m1_delta_tc_gamma <- mean(s1m1_delta_tc_gamma)
ci_m1_delta_tc_gamma <- hdi(s1m1_delta_tc_gamma, credMass = 0.95)

#m2 = impute as 0 all partially-observed HRU but discard partially-observed time point cost data to construct TC
#amount missing resulting in TC
summary(PBS_dataset_quest_cc_hru_AD$AG_TC_imp)
hist(PBS_dataset_quest_cc_hru_AD$AG_TC_imp[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$AG_TC_imp[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$AG_TC_imp[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$AG_TC_imp[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$AG_TC_imp~PBS_dataset_quest_cc_hru_AD$group)


s1m2_mu_tc0_gamma <- res_s1_method2$res_s1_method2_gamma$mmu_tc_g0_gamma*1000
s1m2_mu_tc1_gamma <- res_s1_method2$res_s1_method2_gamma$mmu_tc_g1_gamma*1000
s1m2_delta_tc_gamma <- s1m2_mu_tc1_gamma - s1m2_mu_tc0_gamma
c(mean(s1m2_mu_tc0_gamma),hdi(s1m2_mu_tc0_gamma, credMass = 0.95))
c(mean(s1m2_mu_tc1_gamma),hdi(s1m2_mu_tc1_gamma, credMass = 0.95))
c(mean(s1m2_delta_tc_gamma),hdi(s1m2_delta_tc_gamma, credMass = 0.95))
mean_m2_delta_tc_gamma <- mean(s1m2_delta_tc_gamma)
ci_m2_delta_tc_gamma <- hdi(s1m2_delta_tc_gamma, credMass = 0.95)

#m3 = impute as 0 all partially-observed HRU and time point cost data to construct TC
#amount missing resulting in TC
summary(PBS_dataset_quest_cc_hru_AD$AG_TC_imp_imp)
hist(PBS_dataset_quest_cc_hru_AD$AG_TC_imp_imp[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$AG_TC_imp_imp[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$AG_TC_imp_imp[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$AG_TC_imp_imp[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$AG_TC_imp_imp~PBS_dataset_quest_cc_hru_AD$group)

s1m3_mu_tc0_gamma <- res_s1_method3$res_s1_method3_gamma$mmu_tc_g0_gamma*1000
s1m3_mu_tc1_gamma <- res_s1_method3$res_s1_method3_gamma$mmu_tc_g1_gamma*1000
s1m3_delta_tc_gamma <- s1m3_mu_tc1_gamma - s1m3_mu_tc0_gamma
c(mean(s1m3_mu_tc0_gamma),hdi(s1m3_mu_tc0_gamma, credMass = 0.95))
c(mean(s1m3_mu_tc1_gamma),hdi(s1m3_mu_tc1_gamma, credMass = 0.95))
c(mean(s1m3_delta_tc_gamma),hdi(s1m3_delta_tc_gamma, credMass = 0.95))
mean_m3_delta_tc_gamma <- mean(s1m3_delta_tc_gamma)
ci_m3_delta_tc_gamma <- hdi(s1m3_delta_tc_gamma, credMass = 0.95)

#construct ggdataframe for plotting comparison
df_s1 <- data.frame(
  "method" <- c("m1","m2","m3"),
  "estimate" <- c(mean_m1_delta_tc_gamma,mean_m2_delta_tc_gamma,mean_m3_delta_tc_gamma),
  "lb" <- c(ci_m1_delta_tc_gamma[1],ci_m2_delta_tc_gamma[1],ci_m3_delta_tc_gamma[1]),
  "ub" <- c(ci_m1_delta_tc_gamma[2],ci_m2_delta_tc_gamma[2],ci_m3_delta_tc_gamma[2])
)
names(df_s1) <- c("method","estimate","lb","ub")
df_s1$methodf <- as.factor(df_s1$method)

ggplot(df_s1, aes(x=methodf, y=estimate)) + 
  geom_errorbar(aes(ymin=lb, ymax=ub), width=.1, position = position_dodge(width = 0.9)) +
  geom_point(position=position_dodge(width=0.9), size=2) +
  ylab("estimate") +
  xlab("method") +
  theme_classic() + 
  theme(legend.position = "right",
        axis.text.x = element_text(colour = "black"),
        axis.text.y = element_text(colour = "black"),
        panel.spacing = unit(1, "lines"),
        panel.border = element_rect(color = "black", fill = NA, linewidth = 0.5))

#save results
#saveRDS(df_s1,"df_est_s1.rds")


























#ggplot(gg.cost.sim.res_large, aes(x=timef, y=estimate, colour=mdmf)) + 
#geom_errorbar(aes(ymin=lb_estimate, ymax=ub_estimate), width=.1, position = position_dodge(width = 0.9)) +
#  geom_point(position=position_dodge(width=0.9), size=2) +
#  scale_color_manual("",values=c("black", "blue", "darkgreen", "red")) +
#  facet_grid(trtf~structuref) +
#  ylim(1100,2050) +
#  ylab("estimate") +
#  scale_x_discrete(breaks=c(1,2,3),labels=c("1", "2", "3")) +
#  xlab("time") +
#  theme_classic() + 
#  theme(legend.position = "right",
#        axis.text.x = element_text(colour = "black"),
#        axis.text.y = element_text(colour = "black"),
#        panel.spacing = unit(1, "lines"),
#        panel.border = element_rect(color = "black", fill = NA, linewidth = 0.5))
