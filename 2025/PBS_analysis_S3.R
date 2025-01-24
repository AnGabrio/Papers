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

#3)Disaggregated HRU: HRU-specific and time-specific variables
#put together all disaggregated HRU data 

PBS_dataset_quest_cc_hru_AD <- data.frame(PBS_dataset_quest$pid,PBS_dataset_quest$site.x,PBS_dataset_quest$group.x)
names(PBS_dataset_quest_cc_hru_AD) <- c("pid","site","group")

HRU_PSYDR0 <- PBS_dataset_quest_cc_hru$T0psydr_visits
HRU_PSYCH0 <- PBS_dataset_quest_cc_hru$T0psych_visits
HRU_PHYSI0 <- PBS_dataset_quest_cc_hru$T0physio_visits
HRU_DENT0 <- PBS_dataset_quest_cc_hru$T0dentist_visits
HRU_SOCWORK0 <- PBS_dataset_quest_cc_hru$T0socialwork_visits
HRU_COMWORK0 <- PBS_dataset_quest_cc_hru$T0comwork_visits
HRU_GP0 <- PBS_dataset_quest_cc_hru$T0gp_visits
HRU_NURSE0 <- PBS_dataset_quest_cc_hru$T0nurse_visits
HRU_THERAP0 <- PBS_dataset_quest_cc_hru$T0therapist_visits

#plot histograms of data
library(ggplot2)
n_0 <- length(HRU_PSYDR0)
HRU_df0 <- data.frame(
  HRU = c(rep("PSYDR",n_0), rep("PSYCH",n_0), rep("PHYSI",n_0), 
          rep("DENT",n_0), rep("SOCWORK",n_0), rep("COMWORK",n_0),
          rep("GP",n_0), rep("NURSE",n_0), rep("THERAP",n_0)),
  visits = c(HRU_PSYDR0,HRU_PSYCH0,HRU_PHYSI0,HRU_DENT0,
             HRU_SOCWORK0,HRU_COMWORK0,HRU_GP0,HRU_NURSE0,HRU_THERAP0)
)
HRU_df0$HRU_f <- factor(HRU_df0$HRU, levels = c("PSYDR","PSYCH","PHYSI","DENT","SOCWORK","COMWORK","GP","NURSE","THERAP"))

ggplot(HRU_df0, aes(x = visits)) +
  geom_histogram(color="black", fill="grey") +
  facet_wrap(~HRU_f, scales = "free") +
  scale_y_continuous(expand = c(0,0)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        legend.title = element_blank(), legend.key = element_rect(fill = "white"),
        axis.text = element_text(colour = 'black', face="bold"), axis.ticks.x=element_blank(),
        strip.background =element_rect(fill="white"), strip.text = element_text(colour = 'black',face = "bold")) +
  labs(y = "frequency", x = "n of visits") 



HRU_PSYDR1 <- PBS_dataset_quest_cc_hru$T1psydr_visits
HRU_PSYCH1 <- PBS_dataset_quest_cc_hru$T1psych_visits
HRU_PHYSI1 <- PBS_dataset_quest_cc_hru$T1physio_visits
HRU_DENT1 <- PBS_dataset_quest_cc_hru$T1dentist_visits
HRU_SOCWORK1 <- PBS_dataset_quest_cc_hru$T1socialwork_visits
HRU_COMWORK1 <- PBS_dataset_quest_cc_hru$T1comwork_visits
HRU_GP1 <- PBS_dataset_quest_cc_hru$T1gp_visits
HRU_NURSE1 <- PBS_dataset_quest_cc_hru$T1nurse_visits
HRU_THERAP1 <- PBS_dataset_quest_cc_hru$T1therapist_visits

#plot histograms of data
library(ggplot2)
n_1 <- length(HRU_PSYDR1)
HRU_df1 <- data.frame(
  HRU = c(rep("PSYDR",n_1), rep("PSYCH",n_1), rep("PHYSI",n_1), 
          rep("DENT",n_1), rep("SOCWORK",n_1), rep("COMWORK",n_1),
          rep("GP",n_1), rep("NURSE",n_1), rep("THERAP",n_1)),
  visits = c(HRU_PSYDR1,HRU_PSYCH1,HRU_PHYSI1,HRU_DENT1,
             HRU_SOCWORK1,HRU_COMWORK1,HRU_GP1,HRU_NURSE1,HRU_THERAP1)
)

HRU_df1$HRU_f <- factor(HRU_df1$HRU, levels = c("PSYDR","PSYCH","PHYSI","DENT","SOCWORK","COMWORK","GP","NURSE","THERAP"))


ggplot(HRU_df1, aes(x = visits)) +
  geom_histogram(color="black", fill="grey") +
  facet_wrap(~HRU_f, scales = "free") +
  scale_y_continuous(expand = c(0,0)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        legend.title = element_blank(), legend.key = element_rect(fill = "white"),
        axis.text = element_text(colour = 'black', face="bold"), axis.ticks.x=element_blank(),
        strip.background =element_rect(fill="white"), strip.text = element_text(colour = 'black',face = "bold")) +
  labs(y = "frequency", x = "n of visits") 


HRU_PSYDR2 <- PBS_dataset_quest_cc_hru$T2psydr_visits
HRU_PSYCH2 <- PBS_dataset_quest_cc_hru$T2psych_visits
HRU_PHYSI2 <- PBS_dataset_quest_cc_hru$T2physio_visits
HRU_DENT2 <- PBS_dataset_quest_cc_hru$T2dentist_visits
HRU_SOCWORK2 <- PBS_dataset_quest_cc_hru$T2socialwork_visits
HRU_COMWORK2 <- PBS_dataset_quest_cc_hru$T2comwork_visits
HRU_GP2 <- PBS_dataset_quest_cc_hru$T2gp_visits
HRU_NURSE2 <- PBS_dataset_quest_cc_hru$T2nurse_visits
HRU_THERAP2 <- PBS_dataset_quest_cc_hru$T2therapist_visits

#plot histograms of data
library(ggplot2)
n_2 <- length(HRU_PSYDR2)
HRU_df2 <- data.frame(
  HRU = c(rep("PSYDR",n_2), rep("PSYCH",n_2), rep("PHYSI",n_2), 
          rep("DENT",n_2), rep("SOCWORK",n_2), rep("COMWORK",n_2),
          rep("GP",n_2), rep("NURSE",n_2), rep("THERAP",n_2)),
  visits = c(HRU_PSYDR2,HRU_PSYCH2,HRU_PHYSI2,HRU_DENT2,
             HRU_SOCWORK2,HRU_COMWORK2,HRU_GP2,HRU_NURSE2,HRU_THERAP2)
)

HRU_df2$HRU_f <- factor(HRU_df2$HRU, levels = c("PSYDR","PSYCH","PHYSI","DENT","SOCWORK","COMWORK","GP","NURSE","THERAP"))


ggplot(HRU_df2, aes(x = visits)) +
  geom_histogram(color="black", fill="grey") +
  facet_wrap(~HRU_f, scales = "free") + 
  scale_y_continuous(expand = c(0,0)) +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),
        panel.background = element_blank(), axis.line = element_line(colour = "black"),
        legend.title = element_blank(), legend.key = element_rect(fill = "white"),
        axis.text = element_text(colour = 'black', face="bold"), axis.ticks.x=element_blank(),
        strip.background =element_rect(fill="white"), strip.text = element_text(colour = 'black',face = "bold")) +
  labs(y = "frequency", x = "n of visits") 


#check missingness in HRU across category at each time 

PBS_dataset_quest_cc_hru_AD$HRU_PSYDR0 <- HRU_PSYDR0
PBS_dataset_quest_cc_hru_AD$HRU_PSYCH0 <- HRU_PSYCH0
PBS_dataset_quest_cc_hru_AD$HRU_PHYSI0 <- HRU_PHYSI0
PBS_dataset_quest_cc_hru_AD$HRU_DENT0 <- HRU_DENT0
PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK0 <- HRU_SOCWORK0
PBS_dataset_quest_cc_hru_AD$HRU_COMWORK0 <- HRU_COMWORK0
PBS_dataset_quest_cc_hru_AD$HRU_GP0 <- HRU_GP0
PBS_dataset_quest_cc_hru_AD$HRU_NURSE0 <- HRU_NURSE0
PBS_dataset_quest_cc_hru_AD$HRU_THERAP0 <- HRU_THERAP0

PBS_dataset_quest_cc_hru_AD_HRU0 <- PBS_dataset_quest_cc_hru_AD[,c("HRU_PSYDR0","HRU_PSYCH0","HRU_PHYSI0","HRU_DENT0",
                               "HRU_SOCWORK0","HRU_COMWORK0","HRU_GP0","HRU_NURSE0","HRU_THERAP0")]
PBS_dataset_quest_cc_hru_AD_HRU0 <- PBS_dataset_quest_cc_hru_AD_HRU0[complete.cases(PBS_dataset_quest_cc_hru_AD_HRU0),]

PBS_dataset_quest_cc_hru_AD$HRU_PSYDR1 <- HRU_PSYDR1
PBS_dataset_quest_cc_hru_AD$HRU_PSYCH1 <- HRU_PSYCH1
PBS_dataset_quest_cc_hru_AD$HRU_PHYSI1 <- HRU_PHYSI1
PBS_dataset_quest_cc_hru_AD$HRU_DENT1 <- HRU_DENT1
PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK1 <- HRU_SOCWORK1
PBS_dataset_quest_cc_hru_AD$HRU_COMWORK1 <- HRU_COMWORK1
PBS_dataset_quest_cc_hru_AD$HRU_GP1 <- HRU_GP1
PBS_dataset_quest_cc_hru_AD$HRU_NURSE1 <- HRU_NURSE1
PBS_dataset_quest_cc_hru_AD$HRU_THERAP1 <- HRU_THERAP1

PBS_dataset_quest_cc_hru_AD_HRU1 <- PBS_dataset_quest_cc_hru_AD[,c("HRU_PSYDR1","HRU_PSYCH1","HRU_PHYSI1","HRU_DENT1",
                                                                   "HRU_SOCWORK1","HRU_COMWORK1","HRU_GP1","HRU_NURSE1","HRU_THERAP1")]
PBS_dataset_quest_cc_hru_AD_HRU1 <- PBS_dataset_quest_cc_hru_AD_HRU1[complete.cases(PBS_dataset_quest_cc_hru_AD_HRU1),]

PBS_dataset_quest_cc_hru_AD$HRU_PSYDR2 <- HRU_PSYDR2
PBS_dataset_quest_cc_hru_AD$HRU_PSYCH2 <- HRU_PSYCH2
PBS_dataset_quest_cc_hru_AD$HRU_PHYSI2 <- HRU_PHYSI2
PBS_dataset_quest_cc_hru_AD$HRU_DENT2 <- HRU_DENT2
PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK2 <- HRU_SOCWORK2
PBS_dataset_quest_cc_hru_AD$HRU_COMWORK2 <- HRU_COMWORK2
PBS_dataset_quest_cc_hru_AD$HRU_GP2 <- HRU_GP2
PBS_dataset_quest_cc_hru_AD$HRU_NURSE2 <- HRU_NURSE2
PBS_dataset_quest_cc_hru_AD$HRU_THERAP2 <- HRU_THERAP2

PBS_dataset_quest_cc_hru_AD_HRU2 <- PBS_dataset_quest_cc_hru_AD[,c("HRU_PSYDR2","HRU_PSYCH2","HRU_PHYSI2","HRU_DENT2",
                                                                   "HRU_SOCWORK2","HRU_COMWORK2","HRU_GP2","HRU_NURSE2","HRU_THERAP2")]
PBS_dataset_quest_cc_hru_AD_HRU2 <- PBS_dataset_quest_cc_hru_AD_HRU2[complete.cases(PBS_dataset_quest_cc_hru_AD_HRU2),]

#check missingness in HRU category across time

PBS_dataset_quest_cc_hru_AD_PSYDR <- PBS_dataset_quest_cc_hru_AD[,c("HRU_PSYDR0","HRU_PSYDR1","HRU_PSYDR2")]
PBS_dataset_quest_cc_hru_AD_PSYDR <- PBS_dataset_quest_cc_hru_AD_PSYDR[complete.cases(PBS_dataset_quest_cc_hru_AD_PSYDR),]
PBS_dataset_quest_cc_hru_AD_PSYCH <- PBS_dataset_quest_cc_hru_AD[,c("HRU_PSYCH0","HRU_PSYCH1","HRU_PSYCH2")]
PBS_dataset_quest_cc_hru_AD_PSYCH <- PBS_dataset_quest_cc_hru_AD_PSYCH[complete.cases(PBS_dataset_quest_cc_hru_AD_PSYCH),]
PBS_dataset_quest_cc_hru_AD_PHYSI <- PBS_dataset_quest_cc_hru_AD[,c("HRU_PHYSI0","HRU_PHYSI1","HRU_PHYSI2")]
PBS_dataset_quest_cc_hru_AD_PHYSI <- PBS_dataset_quest_cc_hru_AD_PHYSI[complete.cases(PBS_dataset_quest_cc_hru_AD_PHYSI),]
PBS_dataset_quest_cc_hru_AD_DENT <- PBS_dataset_quest_cc_hru_AD[,c("HRU_DENT0","HRU_DENT1","HRU_DENT2")]
PBS_dataset_quest_cc_hru_AD_DENT <- PBS_dataset_quest_cc_hru_AD_DENT[complete.cases(PBS_dataset_quest_cc_hru_AD_DENT),]
PBS_dataset_quest_cc_hru_AD_SOCWORK <- PBS_dataset_quest_cc_hru_AD[,c("HRU_SOCWORK0","HRU_SOCWORK1","HRU_SOCWORK2")]
PBS_dataset_quest_cc_hru_AD_SOCWORK <- PBS_dataset_quest_cc_hru_AD_SOCWORK[complete.cases(PBS_dataset_quest_cc_hru_AD_SOCWORK),]
PBS_dataset_quest_cc_hru_AD_COMWORK <- PBS_dataset_quest_cc_hru_AD[,c("HRU_COMWORK0","HRU_COMWORK1","HRU_COMWORK2")]
PBS_dataset_quest_cc_hru_AD_COMWORK <- PBS_dataset_quest_cc_hru_AD_COMWORK[complete.cases(PBS_dataset_quest_cc_hru_AD_COMWORK),]
PBS_dataset_quest_cc_hru_AD_GP <- PBS_dataset_quest_cc_hru_AD[,c("HRU_GP0","HRU_GP1","HRU_GP2")]
PBS_dataset_quest_cc_hru_AD_GP <- PBS_dataset_quest_cc_hru_AD_GP[complete.cases(PBS_dataset_quest_cc_hru_AD_GP),]
PBS_dataset_quest_cc_hru_AD_NURSE <- PBS_dataset_quest_cc_hru_AD[,c("HRU_NURSE0","HRU_NURSE1","HRU_NURSE2")]
PBS_dataset_quest_cc_hru_AD_NURSE <- PBS_dataset_quest_cc_hru_AD_NURSE[complete.cases(PBS_dataset_quest_cc_hru_AD_NURSE),]
PBS_dataset_quest_cc_hru_AD_THERAP <- PBS_dataset_quest_cc_hru_AD[,c("HRU_THERAP0","HRU_THERAP1","HRU_THERAP2")]
PBS_dataset_quest_cc_hru_AD_THERAP <- PBS_dataset_quest_cc_hru_AD_THERAP[complete.cases(PBS_dataset_quest_cc_hru_AD_THERAP),]

#check missingness in HRU across time and category

PBS_dataset_quest_cc_hru_AD_HRU <- PBS_dataset_quest_cc_hru_AD[,c("HRU_PSYDR0","HRU_PSYCH0","HRU_PHYSI0","HRU_DENT0",
                                                                   "HRU_SOCWORK0","HRU_COMWORK0","HRU_GP0","HRU_NURSE0","HRU_THERAP0",
                                                                  "HRU_PSYDR1","HRU_PSYCH1","HRU_PHYSI1","HRU_DENT1",
                                                                  "HRU_SOCWORK1","HRU_COMWORK1","HRU_GP1","HRU_NURSE1","HRU_THERAP1",
                                                                  "HRU_PSYDR2","HRU_PSYCH2","HRU_PHYSI2","HRU_DENT2",
                                                                  "HRU_SOCWORK2","HRU_COMWORK2","HRU_GP2","HRU_NURSE2","HRU_THERAP2")]
PBS_dataset_quest_cc_hru_AD_HRU <- PBS_dataset_quest_cc_hru_AD_HRU[complete.cases(PBS_dataset_quest_cc_hru_AD_HRU),]



#assume HRU missing at time j if fully missing at that time / else treat it as 0 if only partially missing at that time


HRU_PSYDR0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) | is.na(PBS_dataset_quest$T0psych_visits) | is.na(PBS_dataset_quest$T0physio_visits) |
                           is.na(PBS_dataset_quest$T0dentist_visits) | is.na(PBS_dataset_quest$T0socialwork_visits) | is.na(PBS_dataset_quest$T0comwork_visits) |
                           is.na(PBS_dataset_quest_cc_hru$T0gp_visits) | is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), 0, HRU_PSYDR0)
HRU_PSYDR0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) & is.na(PBS_dataset_quest$T0psych_visits) & is.na(PBS_dataset_quest$T0physio_visits) &
                      is.na(PBS_dataset_quest$T0dentist_visits) & is.na(PBS_dataset_quest$T0socialwork_visits) & is.na(PBS_dataset_quest$T0comwork_visits) &
                      is.na(PBS_dataset_quest_cc_hru$T0gp_visits) & is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), NA, HRU_PSYDR0_imp)

HRU_PSYCH0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) | is.na(PBS_dataset_quest$T0psych_visits) | is.na(PBS_dataset_quest$T0physio_visits) |
                           is.na(PBS_dataset_quest$T0dentist_visits) | is.na(PBS_dataset_quest$T0socialwork_visits) | is.na(PBS_dataset_quest$T0comwork_visits) |
                           is.na(PBS_dataset_quest_cc_hru$T0gp_visits) | is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), 0, HRU_PSYCH0)
HRU_PSYCH0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) & is.na(PBS_dataset_quest$T0psych_visits) & is.na(PBS_dataset_quest$T0physio_visits) &
                           is.na(PBS_dataset_quest$T0dentist_visits) & is.na(PBS_dataset_quest$T0socialwork_visits) & is.na(PBS_dataset_quest$T0comwork_visits) &
                           is.na(PBS_dataset_quest_cc_hru$T0gp_visits) & is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), NA, HRU_PSYCH0_imp)

HRU_PHYSI0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) | is.na(PBS_dataset_quest$T0psych_visits) | is.na(PBS_dataset_quest$T0physio_visits) |
                           is.na(PBS_dataset_quest$T0dentist_visits) | is.na(PBS_dataset_quest$T0socialwork_visits) | is.na(PBS_dataset_quest$T0comwork_visits) |
                           is.na(PBS_dataset_quest_cc_hru$T0gp_visits) | is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), 0, HRU_PHYSI0)
HRU_PHYSI0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) & is.na(PBS_dataset_quest$T0psych_visits) & is.na(PBS_dataset_quest$T0physio_visits) &
                           is.na(PBS_dataset_quest$T0dentist_visits) & is.na(PBS_dataset_quest$T0socialwork_visits) & is.na(PBS_dataset_quest$T0comwork_visits) &
                           is.na(PBS_dataset_quest_cc_hru$T0gp_visits) & is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), NA, HRU_PHYSI0_imp)

HRU_DENT0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) | is.na(PBS_dataset_quest$T0psych_visits) | is.na(PBS_dataset_quest$T0physio_visits) |
                           is.na(PBS_dataset_quest$T0dentist_visits) | is.na(PBS_dataset_quest$T0socialwork_visits) | is.na(PBS_dataset_quest$T0comwork_visits) |
                           is.na(PBS_dataset_quest_cc_hru$T0gp_visits) | is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), 0, HRU_DENT0)
HRU_DENT0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) & is.na(PBS_dataset_quest$T0psych_visits) & is.na(PBS_dataset_quest$T0physio_visits) &
                           is.na(PBS_dataset_quest$T0dentist_visits) & is.na(PBS_dataset_quest$T0socialwork_visits) & is.na(PBS_dataset_quest$T0comwork_visits) &
                           is.na(PBS_dataset_quest_cc_hru$T0gp_visits) & is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), NA, HRU_DENT0_imp)

HRU_SOCWORK0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) | is.na(PBS_dataset_quest$T0psych_visits) | is.na(PBS_dataset_quest$T0physio_visits) |
                          is.na(PBS_dataset_quest$T0dentist_visits) | is.na(PBS_dataset_quest$T0socialwork_visits) | is.na(PBS_dataset_quest$T0comwork_visits) |
                          is.na(PBS_dataset_quest_cc_hru$T0gp_visits) | is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), 0, HRU_SOCWORK0)
HRU_SOCWORK0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) & is.na(PBS_dataset_quest$T0psych_visits) & is.na(PBS_dataset_quest$T0physio_visits) &
                          is.na(PBS_dataset_quest$T0dentist_visits) & is.na(PBS_dataset_quest$T0socialwork_visits) & is.na(PBS_dataset_quest$T0comwork_visits) &
                          is.na(PBS_dataset_quest_cc_hru$T0gp_visits) & is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), NA, HRU_SOCWORK0_imp)

HRU_COMWORK0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) | is.na(PBS_dataset_quest$T0psych_visits) | is.na(PBS_dataset_quest$T0physio_visits) |
                             is.na(PBS_dataset_quest$T0dentist_visits) | is.na(PBS_dataset_quest$T0socialwork_visits) | is.na(PBS_dataset_quest$T0comwork_visits) |
                             is.na(PBS_dataset_quest_cc_hru$T0gp_visits) | is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), 0, HRU_COMWORK0)
HRU_COMWORK0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) & is.na(PBS_dataset_quest$T0psych_visits) & is.na(PBS_dataset_quest$T0physio_visits) &
                             is.na(PBS_dataset_quest$T0dentist_visits) & is.na(PBS_dataset_quest$T0socialwork_visits) & is.na(PBS_dataset_quest$T0comwork_visits) &
                             is.na(PBS_dataset_quest_cc_hru$T0gp_visits) & is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), NA, HRU_COMWORK0_imp)

HRU_GP0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) | is.na(PBS_dataset_quest$T0psych_visits) | is.na(PBS_dataset_quest$T0physio_visits) |
                             is.na(PBS_dataset_quest$T0dentist_visits) | is.na(PBS_dataset_quest$T0socialwork_visits) | is.na(PBS_dataset_quest$T0comwork_visits) |
                             is.na(PBS_dataset_quest_cc_hru$T0gp_visits) | is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), 0, HRU_GP0)
HRU_GP0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) & is.na(PBS_dataset_quest$T0psych_visits) & is.na(PBS_dataset_quest$T0physio_visits) &
                             is.na(PBS_dataset_quest$T0dentist_visits) & is.na(PBS_dataset_quest$T0socialwork_visits) & is.na(PBS_dataset_quest$T0comwork_visits) &
                             is.na(PBS_dataset_quest_cc_hru$T0gp_visits) & is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), NA, HRU_GP0_imp)

HRU_NURSE0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) | is.na(PBS_dataset_quest$T0psych_visits) | is.na(PBS_dataset_quest$T0physio_visits) |
                        is.na(PBS_dataset_quest$T0dentist_visits) | is.na(PBS_dataset_quest$T0socialwork_visits) | is.na(PBS_dataset_quest$T0comwork_visits) |
                        is.na(PBS_dataset_quest_cc_hru$T0gp_visits) | is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), 0, HRU_NURSE0)
HRU_NURSE0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) & is.na(PBS_dataset_quest$T0psych_visits) & is.na(PBS_dataset_quest$T0physio_visits) &
                        is.na(PBS_dataset_quest$T0dentist_visits) & is.na(PBS_dataset_quest$T0socialwork_visits) & is.na(PBS_dataset_quest$T0comwork_visits) &
                        is.na(PBS_dataset_quest_cc_hru$T0gp_visits) & is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), NA, HRU_NURSE0_imp)

HRU_THERAP0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) | is.na(PBS_dataset_quest$T0psych_visits) | is.na(PBS_dataset_quest$T0physio_visits) |
                           is.na(PBS_dataset_quest$T0dentist_visits) | is.na(PBS_dataset_quest$T0socialwork_visits) | is.na(PBS_dataset_quest$T0comwork_visits) |
                           is.na(PBS_dataset_quest_cc_hru$T0gp_visits) | is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), 0, HRU_THERAP0)
HRU_THERAP0_imp <- ifelse(is.na(PBS_dataset_quest$T0psydr_visits) & is.na(PBS_dataset_quest$T0psych_visits) & is.na(PBS_dataset_quest$T0physio_visits) &
                           is.na(PBS_dataset_quest$T0dentist_visits) & is.na(PBS_dataset_quest$T0socialwork_visits) & is.na(PBS_dataset_quest$T0comwork_visits) &
                           is.na(PBS_dataset_quest_cc_hru$T0gp_visits) & is.na(PBS_dataset_quest_cc_hru$T0nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T0therapist_visits), NA, HRU_THERAP0_imp)

HRU_PSYDR1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) | is.na(PBS_dataset_quest$T1psych_visits) | is.na(PBS_dataset_quest$T1physio_visits) |
                           is.na(PBS_dataset_quest$T1dentist_visits) | is.na(PBS_dataset_quest$T1socialwork_visits) | is.na(PBS_dataset_quest$T1comwork_visits) |
                           is.na(PBS_dataset_quest_cc_hru$T1gp_visits) | is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), 0, HRU_PSYDR1)
HRU_PSYDR1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) & is.na(PBS_dataset_quest$T1psych_visits) & is.na(PBS_dataset_quest$T1physio_visits) &
                           is.na(PBS_dataset_quest$T1dentist_visits) & is.na(PBS_dataset_quest$T1socialwork_visits) & is.na(PBS_dataset_quest$T1comwork_visits) &
                           is.na(PBS_dataset_quest_cc_hru$T1gp_visits) & is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), NA, HRU_PSYDR1_imp)

HRU_PSYCH1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) | is.na(PBS_dataset_quest$T1psych_visits) | is.na(PBS_dataset_quest$T1physio_visits) |
                           is.na(PBS_dataset_quest$T1dentist_visits) | is.na(PBS_dataset_quest$T1socialwork_visits) | is.na(PBS_dataset_quest$T1comwork_visits) |
                           is.na(PBS_dataset_quest_cc_hru$T1gp_visits) | is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), 0, HRU_PSYCH1)
HRU_PSYCH1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) & is.na(PBS_dataset_quest$T1psych_visits) & is.na(PBS_dataset_quest$T1physio_visits) &
                           is.na(PBS_dataset_quest$T1dentist_visits) & is.na(PBS_dataset_quest$T1socialwork_visits) & is.na(PBS_dataset_quest$T1comwork_visits) &
                           is.na(PBS_dataset_quest_cc_hru$T1gp_visits) & is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), NA, HRU_PSYCH1_imp)

HRU_PHYSI1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) | is.na(PBS_dataset_quest$T1psych_visits) | is.na(PBS_dataset_quest$T1physio_visits) |
                           is.na(PBS_dataset_quest$T1dentist_visits) | is.na(PBS_dataset_quest$T1socialwork_visits) | is.na(PBS_dataset_quest$T1comwork_visits) |
                           is.na(PBS_dataset_quest_cc_hru$T1gp_visits) | is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), 0, HRU_PHYSI1)
HRU_PHYSI1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) & is.na(PBS_dataset_quest$T1psych_visits) & is.na(PBS_dataset_quest$T1physio_visits) &
                           is.na(PBS_dataset_quest$T1dentist_visits) & is.na(PBS_dataset_quest$T1socialwork_visits) & is.na(PBS_dataset_quest$T1comwork_visits) &
                           is.na(PBS_dataset_quest_cc_hru$T1gp_visits) & is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), NA, HRU_PHYSI1_imp)

HRU_DENT1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) | is.na(PBS_dataset_quest$T1psych_visits) | is.na(PBS_dataset_quest$T1physio_visits) |
                          is.na(PBS_dataset_quest$T1dentist_visits) | is.na(PBS_dataset_quest$T1socialwork_visits) | is.na(PBS_dataset_quest$T1comwork_visits) |
                          is.na(PBS_dataset_quest_cc_hru$T1gp_visits) | is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), 0, HRU_DENT1)
HRU_DENT1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) & is.na(PBS_dataset_quest$T1psych_visits) & is.na(PBS_dataset_quest$T1physio_visits) &
                          is.na(PBS_dataset_quest$T1dentist_visits) & is.na(PBS_dataset_quest$T1socialwork_visits) & is.na(PBS_dataset_quest$T1comwork_visits) &
                          is.na(PBS_dataset_quest_cc_hru$T1gp_visits) & is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), NA, HRU_DENT1_imp)

HRU_SOCWORK1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) | is.na(PBS_dataset_quest$T1psych_visits) | is.na(PBS_dataset_quest$T1physio_visits) |
                             is.na(PBS_dataset_quest$T1dentist_visits) | is.na(PBS_dataset_quest$T1socialwork_visits) | is.na(PBS_dataset_quest$T1comwork_visits) |
                             is.na(PBS_dataset_quest_cc_hru$T1gp_visits) | is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), 0, HRU_SOCWORK1)
HRU_SOCWORK1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) & is.na(PBS_dataset_quest$T1psych_visits) & is.na(PBS_dataset_quest$T1physio_visits) &
                             is.na(PBS_dataset_quest$T1dentist_visits) & is.na(PBS_dataset_quest$T1socialwork_visits) & is.na(PBS_dataset_quest$T1comwork_visits) &
                             is.na(PBS_dataset_quest_cc_hru$T1gp_visits) & is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), NA, HRU_SOCWORK1_imp)

HRU_COMWORK1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) | is.na(PBS_dataset_quest$T1psych_visits) | is.na(PBS_dataset_quest$T1physio_visits) |
                             is.na(PBS_dataset_quest$T1dentist_visits) | is.na(PBS_dataset_quest$T1socialwork_visits) | is.na(PBS_dataset_quest$T1comwork_visits) |
                             is.na(PBS_dataset_quest_cc_hru$T1gp_visits) | is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), 0, HRU_COMWORK1)
HRU_COMWORK1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) & is.na(PBS_dataset_quest$T1psych_visits) & is.na(PBS_dataset_quest$T1physio_visits) &
                             is.na(PBS_dataset_quest$T1dentist_visits) & is.na(PBS_dataset_quest$T1socialwork_visits) & is.na(PBS_dataset_quest$T1comwork_visits) &
                             is.na(PBS_dataset_quest_cc_hru$T1gp_visits) & is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), NA, HRU_COMWORK1_imp)

HRU_GP1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) | is.na(PBS_dataset_quest$T1psych_visits) | is.na(PBS_dataset_quest$T1physio_visits) |
                        is.na(PBS_dataset_quest$T1dentist_visits) | is.na(PBS_dataset_quest$T1socialwork_visits) | is.na(PBS_dataset_quest$T1comwork_visits) |
                        is.na(PBS_dataset_quest_cc_hru$T1gp_visits) | is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), 0, HRU_GP1)
HRU_GP1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) & is.na(PBS_dataset_quest$T1psych_visits) & is.na(PBS_dataset_quest$T1physio_visits) &
                        is.na(PBS_dataset_quest$T1dentist_visits) & is.na(PBS_dataset_quest$T1socialwork_visits) & is.na(PBS_dataset_quest$T1comwork_visits) &
                        is.na(PBS_dataset_quest_cc_hru$T1gp_visits) & is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), NA, HRU_GP1_imp)

HRU_NURSE1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) | is.na(PBS_dataset_quest$T1psych_visits) | is.na(PBS_dataset_quest$T1physio_visits) |
                           is.na(PBS_dataset_quest$T1dentist_visits) | is.na(PBS_dataset_quest$T1socialwork_visits) | is.na(PBS_dataset_quest$T1comwork_visits) |
                           is.na(PBS_dataset_quest_cc_hru$T1gp_visits) | is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), 0, HRU_NURSE1)
HRU_NURSE1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) & is.na(PBS_dataset_quest$T1psych_visits) & is.na(PBS_dataset_quest$T1physio_visits) &
                           is.na(PBS_dataset_quest$T1dentist_visits) & is.na(PBS_dataset_quest$T1socialwork_visits) & is.na(PBS_dataset_quest$T1comwork_visits) &
                           is.na(PBS_dataset_quest_cc_hru$T1gp_visits) & is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), NA, HRU_NURSE1_imp)

HRU_THERAP1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) | is.na(PBS_dataset_quest$T1psych_visits) | is.na(PBS_dataset_quest$T1physio_visits) |
                            is.na(PBS_dataset_quest$T1dentist_visits) | is.na(PBS_dataset_quest$T1socialwork_visits) | is.na(PBS_dataset_quest$T1comwork_visits) |
                            is.na(PBS_dataset_quest_cc_hru$T1gp_visits) | is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), 0, HRU_THERAP1)
HRU_THERAP1_imp <- ifelse(is.na(PBS_dataset_quest$T1psydr_visits) & is.na(PBS_dataset_quest$T1psych_visits) & is.na(PBS_dataset_quest$T1physio_visits) &
                            is.na(PBS_dataset_quest$T1dentist_visits) & is.na(PBS_dataset_quest$T1socialwork_visits) & is.na(PBS_dataset_quest$T1comwork_visits) &
                            is.na(PBS_dataset_quest_cc_hru$T1gp_visits) & is.na(PBS_dataset_quest_cc_hru$T1nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T1therapist_visits), NA, HRU_THERAP1_imp)


HRU_PSYDR2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) | is.na(PBS_dataset_quest$T2psych_visits) | is.na(PBS_dataset_quest$T2physio_visits) |
                           is.na(PBS_dataset_quest$T2dentist_visits) | is.na(PBS_dataset_quest$T2socialwork_visits) | is.na(PBS_dataset_quest$T2comwork_visits) |
                           is.na(PBS_dataset_quest_cc_hru$T2gp_visits) | is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), 0, HRU_PSYDR2)
HRU_PSYDR2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) & is.na(PBS_dataset_quest$T2psych_visits) & is.na(PBS_dataset_quest$T2physio_visits) &
                           is.na(PBS_dataset_quest$T2dentist_visits) & is.na(PBS_dataset_quest$T2socialwork_visits) & is.na(PBS_dataset_quest$T2comwork_visits) &
                           is.na(PBS_dataset_quest_cc_hru$T2gp_visits) & is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), NA, HRU_PSYDR2_imp)

HRU_PSYCH2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) | is.na(PBS_dataset_quest$T2psych_visits) | is.na(PBS_dataset_quest$T2physio_visits) |
                           is.na(PBS_dataset_quest$T2dentist_visits) | is.na(PBS_dataset_quest$T2socialwork_visits) | is.na(PBS_dataset_quest$T2comwork_visits) |
                           is.na(PBS_dataset_quest_cc_hru$T2gp_visits) | is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), 0, HRU_PSYCH2)
HRU_PSYCH2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) & is.na(PBS_dataset_quest$T2psych_visits) & is.na(PBS_dataset_quest$T2physio_visits) &
                           is.na(PBS_dataset_quest$T2dentist_visits) & is.na(PBS_dataset_quest$T2socialwork_visits) & is.na(PBS_dataset_quest$T2comwork_visits) &
                           is.na(PBS_dataset_quest_cc_hru$T2gp_visits) & is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), NA, HRU_PSYCH2_imp)

HRU_PHYSI2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) | is.na(PBS_dataset_quest$T2psych_visits) | is.na(PBS_dataset_quest$T2physio_visits) |
                           is.na(PBS_dataset_quest$T2dentist_visits) | is.na(PBS_dataset_quest$T2socialwork_visits) | is.na(PBS_dataset_quest$T2comwork_visits) |
                           is.na(PBS_dataset_quest_cc_hru$T2gp_visits) | is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), 0, HRU_PHYSI2)
HRU_PHYSI2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) & is.na(PBS_dataset_quest$T2psych_visits) & is.na(PBS_dataset_quest$T2physio_visits) &
                           is.na(PBS_dataset_quest$T2dentist_visits) & is.na(PBS_dataset_quest$T2socialwork_visits) & is.na(PBS_dataset_quest$T2comwork_visits) &
                           is.na(PBS_dataset_quest_cc_hru$T2gp_visits) & is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), NA, HRU_PHYSI2_imp)

HRU_DENT2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) | is.na(PBS_dataset_quest$T2psych_visits) | is.na(PBS_dataset_quest$T2physio_visits) |
                          is.na(PBS_dataset_quest$T2dentist_visits) | is.na(PBS_dataset_quest$T2socialwork_visits) | is.na(PBS_dataset_quest$T2comwork_visits) |
                          is.na(PBS_dataset_quest_cc_hru$T2gp_visits) | is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), 0, HRU_DENT2)
HRU_DENT2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) & is.na(PBS_dataset_quest$T2psych_visits) & is.na(PBS_dataset_quest$T2physio_visits) &
                          is.na(PBS_dataset_quest$T2dentist_visits) & is.na(PBS_dataset_quest$T2socialwork_visits) & is.na(PBS_dataset_quest$T2comwork_visits) &
                          is.na(PBS_dataset_quest_cc_hru$T2gp_visits) & is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), NA, HRU_DENT2_imp)

HRU_SOCWORK2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) | is.na(PBS_dataset_quest$T2psych_visits) | is.na(PBS_dataset_quest$T2physio_visits) |
                             is.na(PBS_dataset_quest$T2dentist_visits) | is.na(PBS_dataset_quest$T2socialwork_visits) | is.na(PBS_dataset_quest$T2comwork_visits) |
                             is.na(PBS_dataset_quest_cc_hru$T2gp_visits) | is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), 0, HRU_SOCWORK2)
HRU_SOCWORK2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) & is.na(PBS_dataset_quest$T2psych_visits) & is.na(PBS_dataset_quest$T2physio_visits) &
                             is.na(PBS_dataset_quest$T2dentist_visits) & is.na(PBS_dataset_quest$T2socialwork_visits) & is.na(PBS_dataset_quest$T2comwork_visits) &
                             is.na(PBS_dataset_quest_cc_hru$T2gp_visits) & is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), NA, HRU_SOCWORK2_imp)

HRU_COMWORK2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) | is.na(PBS_dataset_quest$T2psych_visits) | is.na(PBS_dataset_quest$T2physio_visits) |
                             is.na(PBS_dataset_quest$T2dentist_visits) | is.na(PBS_dataset_quest$T2socialwork_visits) | is.na(PBS_dataset_quest$T2comwork_visits) |
                             is.na(PBS_dataset_quest_cc_hru$T2gp_visits) | is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), 0, HRU_COMWORK2)
HRU_COMWORK2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) & is.na(PBS_dataset_quest$T2psych_visits) & is.na(PBS_dataset_quest$T2physio_visits) &
                             is.na(PBS_dataset_quest$T2dentist_visits) & is.na(PBS_dataset_quest$T2socialwork_visits) & is.na(PBS_dataset_quest$T2comwork_visits) &
                             is.na(PBS_dataset_quest_cc_hru$T2gp_visits) & is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), NA, HRU_COMWORK2_imp)

HRU_GP2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) | is.na(PBS_dataset_quest$T2psych_visits) | is.na(PBS_dataset_quest$T2physio_visits) |
                        is.na(PBS_dataset_quest$T2dentist_visits) | is.na(PBS_dataset_quest$T2socialwork_visits) | is.na(PBS_dataset_quest$T2comwork_visits) |
                        is.na(PBS_dataset_quest_cc_hru$T2gp_visits) | is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), 0, HRU_GP2)
HRU_GP2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) & is.na(PBS_dataset_quest$T2psych_visits) & is.na(PBS_dataset_quest$T2physio_visits) &
                        is.na(PBS_dataset_quest$T2dentist_visits) & is.na(PBS_dataset_quest$T2socialwork_visits) & is.na(PBS_dataset_quest$T2comwork_visits) &
                        is.na(PBS_dataset_quest_cc_hru$T2gp_visits) & is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), NA, HRU_GP2_imp)

HRU_NURSE2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) | is.na(PBS_dataset_quest$T2psych_visits) | is.na(PBS_dataset_quest$T2physio_visits) |
                           is.na(PBS_dataset_quest$T2dentist_visits) | is.na(PBS_dataset_quest$T2socialwork_visits) | is.na(PBS_dataset_quest$T2comwork_visits) |
                           is.na(PBS_dataset_quest_cc_hru$T2gp_visits) | is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), 0, HRU_NURSE2)
HRU_NURSE2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) & is.na(PBS_dataset_quest$T2psych_visits) & is.na(PBS_dataset_quest$T2physio_visits) &
                           is.na(PBS_dataset_quest$T2dentist_visits) & is.na(PBS_dataset_quest$T2socialwork_visits) & is.na(PBS_dataset_quest$T2comwork_visits) &
                           is.na(PBS_dataset_quest_cc_hru$T2gp_visits) & is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), NA, HRU_NURSE2_imp)

HRU_THERAP2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) | is.na(PBS_dataset_quest$T2psych_visits) | is.na(PBS_dataset_quest$T2physio_visits) |
                            is.na(PBS_dataset_quest$T2dentist_visits) | is.na(PBS_dataset_quest$T2socialwork_visits) | is.na(PBS_dataset_quest$T2comwork_visits) |
                            is.na(PBS_dataset_quest_cc_hru$T2gp_visits) | is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) | is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), 0, HRU_THERAP2)
HRU_THERAP2_imp <- ifelse(is.na(PBS_dataset_quest$T2psydr_visits) & is.na(PBS_dataset_quest$T2psych_visits) & is.na(PBS_dataset_quest$T2physio_visits) &
                            is.na(PBS_dataset_quest$T2dentist_visits) & is.na(PBS_dataset_quest$T2socialwork_visits) & is.na(PBS_dataset_quest$T2comwork_visits) &
                            is.na(PBS_dataset_quest_cc_hru$T2gp_visits) & is.na(PBS_dataset_quest_cc_hru$T2nurse_visits) & is.na(PBS_dataset_quest_cc_hru$T2therapist_visits), NA, HRU_THERAP2_imp)

PBS_dataset_quest_cc_hru_AD$HRU_PSYDR0_imp <- HRU_PSYDR0_imp
PBS_dataset_quest_cc_hru_AD$HRU_PSYCH0_imp <- HRU_PSYCH0_imp
PBS_dataset_quest_cc_hru_AD$HRU_PHYSI0_imp <- HRU_PHYSI0_imp
PBS_dataset_quest_cc_hru_AD$HRU_DENT0_imp <- HRU_DENT0_imp
PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK0_imp <- HRU_SOCWORK0_imp
PBS_dataset_quest_cc_hru_AD$HRU_COMWORK0_imp <- HRU_COMWORK0_imp
PBS_dataset_quest_cc_hru_AD$HRU_GP0_imp <- HRU_GP0_imp
PBS_dataset_quest_cc_hru_AD$HRU_NURSE0_imp <- HRU_NURSE0_imp
PBS_dataset_quest_cc_hru_AD$HRU_THERAP0_imp <- HRU_THERAP0_imp

PBS_dataset_quest_cc_hru_AD_HRU0_imp <- PBS_dataset_quest_cc_hru_AD[,c("HRU_PSYDR0_imp","HRU_PSYCH0_imp","HRU_PHYSI0_imp","HRU_DENT0_imp",
                                                                       "HRU_SOCWORK0_imp","HRU_COMWORK0_imp","HRU_GP0_imp","HRU_NURSE0_imp","HRU_THERAP0_imp")]
PBS_dataset_quest_cc_hru_AD_HRU0_imp <- PBS_dataset_quest_cc_hru_AD_HRU0_imp[complete.cases(PBS_dataset_quest_cc_hru_AD_HRU0_imp),]


PBS_dataset_quest_cc_hru_AD$HRU_PSYDR1_imp <- HRU_PSYDR1_imp
PBS_dataset_quest_cc_hru_AD$HRU_PSYCH1_imp <- HRU_PSYCH1_imp
PBS_dataset_quest_cc_hru_AD$HRU_PHYSI1_imp <- HRU_PHYSI1_imp
PBS_dataset_quest_cc_hru_AD$HRU_DENT1_imp <- HRU_DENT1_imp
PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK1_imp <- HRU_SOCWORK1_imp
PBS_dataset_quest_cc_hru_AD$HRU_COMWORK1_imp <- HRU_COMWORK1_imp
PBS_dataset_quest_cc_hru_AD$HRU_GP1_imp <- HRU_GP1_imp
PBS_dataset_quest_cc_hru_AD$HRU_NURSE1_imp <- HRU_NURSE1_imp
PBS_dataset_quest_cc_hru_AD$HRU_THERAP1_imp <- HRU_THERAP1_imp

PBS_dataset_quest_cc_hru_AD_HRU1_imp <- PBS_dataset_quest_cc_hru_AD[,c("HRU_PSYDR1_imp","HRU_PSYCH1_imp","HRU_PHYSI1_imp","HRU_DENT1_imp",
                                                                       "HRU_SOCWORK1_imp","HRU_COMWORK1_imp","HRU_GP1_imp","HRU_NURSE1_imp","HRU_THERAP1_imp")]
PBS_dataset_quest_cc_hru_AD_HRU1_imp <- PBS_dataset_quest_cc_hru_AD_HRU1_imp[complete.cases(PBS_dataset_quest_cc_hru_AD_HRU1_imp),]


PBS_dataset_quest_cc_hru_AD$HRU_PSYDR2_imp <- HRU_PSYDR2_imp
PBS_dataset_quest_cc_hru_AD$HRU_PSYCH2_imp <- HRU_PSYCH2_imp
PBS_dataset_quest_cc_hru_AD$HRU_PHYSI2_imp <- HRU_PHYSI2_imp
PBS_dataset_quest_cc_hru_AD$HRU_DENT2_imp <- HRU_DENT2_imp
PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK2_imp <- HRU_SOCWORK2_imp
PBS_dataset_quest_cc_hru_AD$HRU_COMWORK2_imp <- HRU_COMWORK2_imp
PBS_dataset_quest_cc_hru_AD$HRU_GP2_imp <- HRU_GP2_imp
PBS_dataset_quest_cc_hru_AD$HRU_NURSE2_imp <- HRU_NURSE2_imp
PBS_dataset_quest_cc_hru_AD$HRU_THERAP2_imp <- HRU_THERAP2_imp

PBS_dataset_quest_cc_hru_AD_HRU2_imp <- PBS_dataset_quest_cc_hru_AD[,c("HRU_PSYDR2_imp","HRU_PSYCH2_imp","HRU_PHYSI2_imp","HRU_DENT2_imp",
                                                                       "HRU_SOCWORK2_imp","HRU_COMWORK2_imp","HRU_GP2_imp","HRU_NURSE2_imp","HRU_THERAP2_imp")]
PBS_dataset_quest_cc_hru_AD_HRU2_imp <- PBS_dataset_quest_cc_hru_AD_HRU2_imp[complete.cases(PBS_dataset_quest_cc_hru_AD_HRU2_imp),]

#check missingness in HRU imputed across time and category

PBS_dataset_quest_cc_hru_AD_HRU_imp <- PBS_dataset_quest_cc_hru_AD[,c("HRU_PSYDR0_imp","HRU_PSYCH0_imp","HRU_PHYSI0_imp","HRU_DENT0_imp",
                                                                  "HRU_SOCWORK0_imp","HRU_COMWORK0_imp","HRU_GP0_imp","HRU_NURSE0_imp","HRU_THERAP0_imp",
                                                                  "HRU_PSYDR1_imp","HRU_PSYCH1_imp","HRU_PHYSI1_imp","HRU_DENT1_imp",
                                                                  "HRU_SOCWORK1_imp","HRU_COMWORK1_imp","HRU_GP1_imp","HRU_NURSE1_imp","HRU_THERAP1_imp",
                                                                  "HRU_PSYDR2_imp","HRU_PSYCH2_imp","HRU_PHYSI2_imp","HRU_DENT2_imp",
                                                                  "HRU_SOCWORK2_imp","HRU_COMWORK2_imp","HRU_GP2_imp","HRU_NURSE2_imp","HRU_THERAP2_imp")]
PBS_dataset_quest_cc_hru_AD_HRU_imp <- PBS_dataset_quest_cc_hru_AD_HRU_imp[complete.cases(PBS_dataset_quest_cc_hru_AD_HRU_imp),]

#M1) version 1 (no imputation)
#check presence of structural zeros and amount of "other" zeros by each HRU type 

S0_PSYDR <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR0==0 & PBS_dataset_quest_cc_hru_AD$HRU_PSYDR1==0 & PBS_dataset_quest_cc_hru_AD$HRU_PSYDR2==0,1,0) 
S0_PSYCH <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH0==0 & PBS_dataset_quest_cc_hru_AD$HRU_PSYCH1==0 & PBS_dataset_quest_cc_hru_AD$HRU_PSYCH2==0,1,0) 
S0_PHYSI <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI0==0 & PBS_dataset_quest_cc_hru_AD$HRU_PHYSI1==0 & PBS_dataset_quest_cc_hru_AD$HRU_PHYSI2==0,1,0) 
S0_DENT <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_DENT0==0 & PBS_dataset_quest_cc_hru_AD$HRU_DENT1==0 & PBS_dataset_quest_cc_hru_AD$HRU_DENT2==0,1,0) 
S0_SOCWORK <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK0==0 & PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK1==0 & PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK2==0,1,0) 
S0_COMWORK <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK0==0 & PBS_dataset_quest_cc_hru_AD$HRU_COMWORK1==0 & PBS_dataset_quest_cc_hru_AD$HRU_COMWORK2==0,1,0) 
S0_GP <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_GP0==0 & PBS_dataset_quest_cc_hru_AD$HRU_GP1==0 & PBS_dataset_quest_cc_hru_AD$HRU_GP2==0,1,0) 
S0_NURSE <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_NURSE0==0 & PBS_dataset_quest_cc_hru_AD$HRU_NURSE1==0 & PBS_dataset_quest_cc_hru_AD$HRU_NURSE2==0,1,0) 
S0_THERAP <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_THERAP0==0 & PBS_dataset_quest_cc_hru_AD$HRU_THERAP1==0 & PBS_dataset_quest_cc_hru_AD$HRU_THERAP2==0,1,0) 

non_S0_PSYDR0 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR0==0 & S0_PSYDR==0,1,0)
non_S0_PSYCH0 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH0==0 & S0_PSYCH==0,1,0)
non_S0_PHYSI0 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI0==0 & S0_PHYSI==0,1,0)
non_S0_DENT0 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_DENT0==0 & S0_DENT==0,1,0)
non_S0_SOCWORK0 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK0==0 & S0_SOCWORK==0,1,0)
non_S0_COMWORK0 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK0==0 & S0_COMWORK==0,1,0)
non_S0_GP0 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_GP0==0 & S0_GP==0,1,0)
non_S0_NURSE0 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_NURSE0==0 & S0_NURSE==0,1,0)
non_S0_THERAP0 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_THERAP0==0 & S0_THERAP==0,1,0)

non_S0_PSYDR1 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR1==0 & S0_PSYDR==0,1,0)
non_S0_PSYCH1 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH1==0 & S0_PSYCH==0,1,0)
non_S0_PHYSI1 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI1==0 & S0_PHYSI==0,1,0)
non_S0_DENT1 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_DENT1==0 & S0_DENT==0,1,0)
non_S0_SOCWORK1 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK1==0 & S0_SOCWORK==0,1,0)
non_S0_COMWORK1 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK1==0 & S0_COMWORK==0,1,0)
non_S0_GP1 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_GP1==0 & S0_GP==0,1,0)
non_S0_NURSE1 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_NURSE1==0 & S0_NURSE==0,1,0)
non_S0_THERAP1 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_THERAP1==0 & S0_THERAP==0,1,0)

non_S0_PSYDR2 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR2==0 & S0_PSYDR==0,1,0)
non_S0_PSYCH2 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH2==0 & S0_PSYCH==0,1,0)
non_S0_PHYSI2 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI2==0 & S0_PHYSI==0,1,0)
non_S0_DENT2 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_DENT2==0 & S0_DENT==0,1,0)
non_S0_SOCWORK2 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK2==0 & S0_SOCWORK==0,1,0)
non_S0_COMWORK2 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK2==0 & S0_COMWORK==0,1,0)
non_S0_GP2 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_GP2==0 & S0_GP==0,1,0)
non_S0_NURSE2 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_NURSE2==0 & S0_NURSE==0,1,0)
non_S0_THERAP2 <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_THERAP2==0 & S0_THERAP==0,1,0)

PBS_dataset_quest_cc_hru_AD$S0_PSYDR <- S0_PSYDR
PBS_dataset_quest_cc_hru_AD$S0_PSYCH <- S0_PSYCH
PBS_dataset_quest_cc_hru_AD$S0_PHYSI <- S0_PHYSI
PBS_dataset_quest_cc_hru_AD$S0_DENT <- S0_DENT
PBS_dataset_quest_cc_hru_AD$S0_SOCWORK <- S0_SOCWORK
PBS_dataset_quest_cc_hru_AD$S0_COMWORK <- S0_COMWORK
PBS_dataset_quest_cc_hru_AD$S0_GP <- S0_GP
PBS_dataset_quest_cc_hru_AD$S0_NURSE <- S0_NURSE
PBS_dataset_quest_cc_hru_AD$S0_THERAP <- S0_THERAP
PBS_dataset_quest_cc_hru_AD$non_S0_GP0 <- non_S0_GP0
PBS_dataset_quest_cc_hru_AD$non_S0_GP1 <- non_S0_GP1
PBS_dataset_quest_cc_hru_AD$non_S0_GP2 <- non_S0_GP2


#version 2 (imputation of partially missing HRU as 0)
#check presence of structural zeros and amount of "other" zeros by each HRU type 

S0_PSYDR_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR0_imp==0 & PBS_dataset_quest_cc_hru_AD$HRU_PSYDR1_imp==0 & PBS_dataset_quest_cc_hru_AD$HRU_PSYDR2_imp==0,1,0) 
S0_PSYCH_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH0_imp==0 & PBS_dataset_quest_cc_hru_AD$HRU_PSYCH1_imp==0 & PBS_dataset_quest_cc_hru_AD$HRU_PSYCH2_imp==0,1,0) 
S0_PHYSI_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI0_imp==0 & PBS_dataset_quest_cc_hru_AD$HRU_PHYSI1_imp==0 & PBS_dataset_quest_cc_hru_AD$HRU_PHYSI2_imp==0,1,0) 
S0_DENT_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_DENT0_imp==0 & PBS_dataset_quest_cc_hru_AD$HRU_DENT1_imp==0 & PBS_dataset_quest_cc_hru_AD$HRU_DENT2_imp==0,1,0) 
S0_SOCWORK_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK0_imp==0 & PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK1_imp==0 & PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK2_imp==0,1,0) 
S0_COMWORK_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK0_imp==0 & PBS_dataset_quest_cc_hru_AD$HRU_COMWORK1_imp==0 & PBS_dataset_quest_cc_hru_AD$HRU_COMWORK2_imp==0,1,0) 
S0_GP_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_GP0_imp==0 & PBS_dataset_quest_cc_hru_AD$HRU_GP1_imp==0 & PBS_dataset_quest_cc_hru_AD$HRU_GP2_imp==0,1,0) 
S0_NURSE_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_NURSE0_imp==0 & PBS_dataset_quest_cc_hru_AD$HRU_NURSE1_imp==0 & PBS_dataset_quest_cc_hru_AD$HRU_NURSE2_imp==0,1,0) 
S0_THERAP_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_THERAP0_imp==0 & PBS_dataset_quest_cc_hru_AD$HRU_THERAP1_imp==0 & PBS_dataset_quest_cc_hru_AD$HRU_THERAP2_imp==0,1,0) 

non_S0_PSYDR0_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR0_imp==0 & S0_PSYDR_imp==0,1,0)
non_S0_PSYCH0_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH0_imp==0 & S0_PSYCH_imp==0,1,0)
non_S0_PHYSI0_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI0_imp==0 & S0_PHYSI_imp==0,1,0)
non_S0_DENT0_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_DENT0_imp==0 & S0_DENT_imp==0,1,0)
non_S0_SOCWORK0_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK0_imp==0 & S0_SOCWORK_imp==0,1,0)
non_S0_COMWORK0_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK0_imp==0 & S0_COMWORK_imp==0,1,0)
non_S0_GP0_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_GP0_imp==0 & S0_GP_imp==0,1,0)
non_S0_NURSE0_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_NURSE0_imp==0 & S0_NURSE_imp==0,1,0)
non_S0_THERAP0_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_THERAP0_imp==0 & S0_THERAP_imp==0,1,0)

non_S0_PSYDR1_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR1_imp==0 & S0_PSYDR_imp==0,1,0)
non_S0_PSYCH1_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH1_imp==0 & S0_PSYCH_imp==0,1,0)
non_S0_PHYSI1_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI1_imp==0 & S0_PHYSI_imp==0,1,0)
non_S0_DENT1_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_DENT1_imp==0 & S0_DENT_imp==0,1,0)
non_S0_SOCWORK1_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK1_imp==0 & S0_SOCWORK_imp==0,1,0)
non_S0_COMWORK1_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK1_imp==0 & S0_COMWORK_imp==0,1,0)
non_S0_GP1_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_GP1_imp==0 & S0_GP_imp==0,1,0)
non_S0_NURSE1_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_NURSE1_imp==0 & S0_NURSE_imp==0,1,0)
non_S0_THERAP1_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_THERAP1_imp==0 & S0_THERAP_imp==0,1,0)

non_S0_PSYDR2_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR2_imp==0 & S0_PSYDR_imp==0,1,0)
non_S0_PSYCH2_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH2_imp==0 & S0_PSYCH_imp==0,1,0)
non_S0_PHYSI2_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI2_imp==0 & S0_PHYSI_imp==0,1,0)
non_S0_DENT2_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_DENT2_imp==0 & S0_DENT_imp==0,1,0)
non_S0_SOCWORK2_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK2_imp==0 & S0_SOCWORK_imp==0,1,0)
non_S0_COMWORK2_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK2_imp==0 & S0_COMWORK_imp==0,1,0)
non_S0_GP2_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_GP2_imp==0 & S0_GP_imp==0,1,0)
non_S0_NURSE2_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_NURSE2_imp==0 & S0_NURSE_imp==0,1,0)
non_S0_THERAP2_imp <- ifelse(PBS_dataset_quest_cc_hru_AD$HRU_THERAP2_imp==0 & S0_THERAP_imp==0,1,0)

PBS_dataset_quest_cc_hru_AD$S0_PSYDR_imp <- S0_PSYDR_imp
PBS_dataset_quest_cc_hru_AD$S0_PSYCH_imp <- S0_PSYCH_imp
PBS_dataset_quest_cc_hru_AD$S0_PHYSI_imp <- S0_PHYSI_imp
PBS_dataset_quest_cc_hru_AD$S0_DENT_imp <- S0_DENT_imp
PBS_dataset_quest_cc_hru_AD$S0_SOCWORK_imp <- S0_SOCWORK_imp
PBS_dataset_quest_cc_hru_AD$S0_COMWORK_imp <- S0_COMWORK_imp
PBS_dataset_quest_cc_hru_AD$S0_GP_imp <- S0_GP_imp
PBS_dataset_quest_cc_hru_AD$S0_NURSE_imp <- S0_NURSE_imp
PBS_dataset_quest_cc_hru_AD$S0_THERAP_imp <- S0_THERAP_imp
PBS_dataset_quest_cc_hru_AD$non_S0_GP0_imp <- non_S0_GP0_imp
PBS_dataset_quest_cc_hru_AD$non_S0_GP1_imp <- non_S0_GP1_imp
PBS_dataset_quest_cc_hru_AD$non_S0_GP2_imp <- non_S0_GP2_imp

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
HRU_PSYDR1 <- PBS_dataset_quest_cc_hru_AD$HRU_PSYDR1
HRU_PSYCH1 <- PBS_dataset_quest_cc_hru_AD$HRU_PSYCH1
HRU_PHYSI1 <- PBS_dataset_quest_cc_hru_AD$HRU_PHYSI1
HRU_DENT1 <- PBS_dataset_quest_cc_hru_AD$HRU_DENT1
HRU_SOCWORK1 <- PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK1
HRU_COMWORK1 <- PBS_dataset_quest_cc_hru_AD$HRU_COMWORK1
HRU_GP1 <- PBS_dataset_quest_cc_hru_AD$HRU_GP1
HRU_NURSE1 <- PBS_dataset_quest_cc_hru_AD$HRU_NURSE1
HRU_THERAP1 <- PBS_dataset_quest_cc_hru_AD$HRU_THERAP1
HRU_PSYDR2 <- PBS_dataset_quest_cc_hru_AD$HRU_PSYDR2
HRU_PSYCH2 <- PBS_dataset_quest_cc_hru_AD$HRU_PSYCH2
HRU_PHYSI2 <- PBS_dataset_quest_cc_hru_AD$HRU_PHYSI2
HRU_DENT2 <- PBS_dataset_quest_cc_hru_AD$HRU_DENT2
HRU_SOCWORK2 <- PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK2
HRU_COMWORK2 <- PBS_dataset_quest_cc_hru_AD$HRU_COMWORK2
HRU_GP2 <- PBS_dataset_quest_cc_hru_AD$HRU_GP2
HRU_NURSE2 <- PBS_dataset_quest_cc_hru_AD$HRU_NURSE2
HRU_THERAP2 <- PBS_dataset_quest_cc_hru_AD$HRU_THERAP2
group <- PBS_dataset_quest_cc_hru_AD$group
HRU_PSYDR0 <- PBS_dataset_quest_cc_hru_AD$HRU_PSYDR0
HRU_PSYCH0 <- PBS_dataset_quest_cc_hru_AD$HRU_PSYCH0
HRU_PHYSI0 <- PBS_dataset_quest_cc_hru_AD$HRU_PHYSI0
HRU_DENT0 <- PBS_dataset_quest_cc_hru_AD$HRU_DENT0
HRU_SOCWORK0 <- PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK0
HRU_COMWORK0 <- PBS_dataset_quest_cc_hru_AD$HRU_COMWORK0
HRU_GP0 <- PBS_dataset_quest_cc_hru_AD$HRU_GP0
HRU_NURSE0 <- PBS_dataset_quest_cc_hru_AD$HRU_NURSE0
HRU_THERAP0 <- PBS_dataset_quest_cc_hru_AD$HRU_THERAP0

hist(HRU_PSYDR2[group==0])
summary(HRU_PSYDR2[group==0])
hist(HRU_PSYCH2[group==0])
summary(HRU_PSYCH2[group==0])
hist(HRU_PHYSI2[group==0])
summary(HRU_PHYSI2[group==0])
hist(HRU_DENT2[group==0])
summary(HRU_DENT2[group==0])
hist(HRU_SOCWORK2[group==0])
summary(HRU_SOCWORK2[group==0])
hist(HRU_COMWORK2[group==0])
summary(HRU_COMWORK2[group==0])
hist(HRU_GP2[group==0])
summary(HRU_GP2[group==0])
hist(HRU_NURSE2[group==0])
summary(HRU_NURSE2[group==0])
hist(HRU_THERAP2[group==0])
summary(HRU_THERAP2[group==0])
hist(HRU_PSYDR1[group==0])
summary(HRU_PSYDR1[group==0])
hist(HRU_PSYCH1[group==0])
summary(HRU_PSYCH1[group==0])
hist(HRU_PHYSI1[group==0])
summary(HRU_PHYSI1[group==0])
hist(HRU_DENT1[group==0])
summary(HRU_DENT1[group==0])
hist(HRU_SOCWORK1[group==0])
summary(HRU_SOCWORK1[group==0])
hist(HRU_COMWORK1[group==0])
summary(HRU_COMWORK1[group==0])
hist(HRU_GP1[group==0])
summary(HRU_GP1[group==0])
hist(HRU_NURSE1[group==0])
summary(HRU_NURSE1[group==0])
hist(HRU_THERAP1[group==0])
summary(HRU_THERAP1[group==0])
hist(HRU_PSYDR0[group==0])
summary(HRU_PSYDR0[group==0])
hist(HRU_PSYCH0[group==0])
summary(HRU_PSYCH0[group==0])
hist(HRU_PHYSI0[group==0])
summary(HRU_PHYSI0[group==0])
hist(HRU_DENT0[group==0])
summary(HRU_DENT0[group==0])
hist(HRU_SOCWORK0[group==0])
summary(HRU_SOCWORK0[group==0])
hist(HRU_COMWORK0[group==0])
summary(HRU_COMWORK0[group==0])
hist(HRU_GP0[group==0])
summary(HRU_GP0[group==0])
hist(HRU_NURSE0[group==0])
summary(HRU_NURSE0[group==0])
hist(HRU_THERAP0[group==0])
summary(HRU_THERAP0[group==0])

hist(HRU_PSYDR2[group==1])
summary(HRU_PSYDR2[group==1])
hist(HRU_PSYCH2[group==1])
summary(HRU_PSYCH2[group==1])
hist(HRU_PHYSI2[group==1])
summary(HRU_PHYSI2[group==1])
hist(HRU_DENT2[group==1])
summary(HRU_DENT2[group==1])
hist(HRU_SOCWORK2[group==1])
summary(HRU_SOCWORK2[group==1])
hist(HRU_COMWORK2[group==1])
summary(HRU_COMWORK2[group==1])
hist(HRU_GP2[group==1])
summary(HRU_GP2[group==1])
hist(HRU_NURSE2[group==1])
summary(HRU_NURSE2[group==1])
hist(HRU_THERAP2[group==1])
summary(HRU_THERAP2[group==1])
hist(HRU_PSYDR1[group==1])
summary(HRU_PSYDR1[group==1])
hist(HRU_PSYCH1[group==1])
summary(HRU_PSYCH1[group==1])
hist(HRU_PHYSI1[group==1])
summary(HRU_PHYSI1[group==1])
hist(HRU_DENT1[group==1])
summary(HRU_DENT1[group==1])
hist(HRU_SOCWORK1[group==1])
summary(HRU_SOCWORK1[group==1])
hist(HRU_COMWORK1[group==1])
summary(HRU_COMWORK1[group==1])
hist(HRU_GP1[group==1])
summary(HRU_GP1[group==1])
hist(HRU_NURSE1[group==1])
summary(HRU_NURSE1[group==1])
hist(HRU_THERAP1[group==1])
summary(HRU_THERAP1[group==1])
hist(HRU_PSYDR0[group==1])
summary(HRU_PSYDR0[group==1])
hist(HRU_PSYCH0[group==1])
summary(HRU_PSYCH0[group==1])
hist(HRU_PHYSI0[group==1])
summary(HRU_PHYSI0[group==1])
hist(HRU_DENT0[group==1])
summary(HRU_DENT0[group==1])
hist(HRU_SOCWORK0[group==1])
summary(HRU_SOCWORK0[group==1])
hist(HRU_COMWORK0[group==1])
summary(HRU_COMWORK0[group==1])
hist(HRU_GP0[group==1])
summary(HRU_GP0[group==1])
hist(HRU_NURSE0[group==1])
summary(HRU_NURSE0[group==1])
hist(HRU_THERAP0[group==1])
summary(HRU_THERAP0[group==1])

#check fit of standard distributions to observed data for HRU and HRU_0 (since missing values in both)
library(fitdistrplus)
plotdist(HRU_PSYDR2[complete.cases(HRU_PSYDR2)], histo = TRUE, demp = TRUE)
descdist(HRU_PSYDR2[complete.cases(HRU_PSYDR2)], boot = 1000)
fp <- fitdist(HRU_PSYDR2[complete.cases(HRU_PSYDR2)], "pois")
fnb <- fitdist(HRU_PSYDR2[complete.cases(HRU_PSYDR2)], "nbinom")
fn <- fitdist(HRU_PSYDR2[complete.cases(HRU_PSYDR2)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_PSYCH2[complete.cases(HRU_PSYCH2)], histo = TRUE, demp = TRUE)
descdist(HRU_PSYCH2[complete.cases(HRU_PSYCH2)], boot = 1000)
fp <- fitdist(HRU_PSYCH2[complete.cases(HRU_PSYCH2)], "pois")
fnb <- fitdist(HRU_PSYCH2[complete.cases(HRU_PSYCH2)], "nbinom")
fn <- fitdist(HRU_PSYCH2[complete.cases(HRU_PSYCH2)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_PHYSI2[complete.cases(HRU_PHYSI2)], histo = TRUE, demp = TRUE)
descdist(HRU_PHYSI2[complete.cases(HRU_PHYSI2)], boot = 1000)
fp <- fitdist(HRU_PHYSI2[complete.cases(HRU_PHYSI2)], "pois")
fnb <- fitdist(HRU_PHYSI2[complete.cases(HRU_PHYSI2)], "nbinom")
fn <- fitdist(HRU_PHYSI2[complete.cases(HRU_PHYSI2)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_DENT2[complete.cases(HRU_DENT2)], histo = TRUE, demp = TRUE)
descdist(HRU_DENT2[complete.cases(HRU_DENT2)], boot = 1000)
fp <- fitdist(HRU_DENT2[complete.cases(HRU_DENT2)], "pois")
fnb <- fitdist(HRU_DENT2[complete.cases(HRU_DENT2)], "nbinom")
fn <- fitdist(HRU_DENT2[complete.cases(HRU_DENT2)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_SOCWORK2[complete.cases(HRU_SOCWORK2)], histo = TRUE, demp = TRUE)
descdist(HRU_SOCWORK2[complete.cases(HRU_SOCWORK2)], boot = 1000)
fp <- fitdist(HRU_SOCWORK2[complete.cases(HRU_SOCWORK2)], "pois")
fnb <- fitdist(HRU_SOCWORK2[complete.cases(HRU_SOCWORK2)], "nbinom")
fn <- fitdist(HRU_SOCWORK2[complete.cases(HRU_SOCWORK2)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_COMWORK2[complete.cases(HRU_COMWORK2)], histo = TRUE, demp = TRUE)
descdist(HRU_COMWORK2[complete.cases(HRU_COMWORK2)], boot = 1000)
fp <- fitdist(HRU_COMWORK2[complete.cases(HRU_COMWORK2)], "pois")
fnb <- fitdist(HRU_COMWORK2[complete.cases(HRU_COMWORK2)], "nbinom")
fn <- fitdist(HRU_COMWORK2[complete.cases(HRU_COMWORK2)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_GP2[complete.cases(HRU_GP2)], histo = TRUE, demp = TRUE)
descdist(HRU_GP2[complete.cases(HRU_GP2)], boot = 1000)
fp <- fitdist(HRU_GP2[complete.cases(HRU_GP2)], "pois")
fnb <- fitdist(HRU_GP2[complete.cases(HRU_GP2)], "nbinom")
fn <- fitdist(HRU_GP2[complete.cases(HRU_GP2)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_NURSE2[complete.cases(HRU_NURSE2)], histo = TRUE, demp = TRUE)
descdist(HRU_NURSE2[complete.cases(HRU_NURSE2)], boot = 1000)
fp <- fitdist(HRU_NURSE2[complete.cases(HRU_NURSE2)], "pois")
fnb <- fitdist(HRU_NURSE2[complete.cases(HRU_NURSE2)], "nbinom")
fn <- fitdist(HRU_NURSE2[complete.cases(HRU_NURSE2)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_THERAP2[complete.cases(HRU_THERAP2)], histo = TRUE, demp = TRUE)
descdist(HRU_THERAP2[complete.cases(HRU_THERAP2)], boot = 1000)
fp <- fitdist(HRU_THERAP2[complete.cases(HRU_THERAP2)], "pois")
fnb <- fitdist(HRU_THERAP2[complete.cases(HRU_THERAP2)], "nbinom")
fn <- fitdist(HRU_THERAP2[complete.cases(HRU_THERAP2)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_PSYDR1[complete.cases(HRU_PSYDR1)], histo = TRUE, demp = TRUE)
descdist(HRU_PSYDR1[complete.cases(HRU_PSYDR1)], boot = 1000)
fp <- fitdist(HRU_PSYDR1[complete.cases(HRU_PSYDR1)], "pois")
fnb <- fitdist(HRU_PSYDR1[complete.cases(HRU_PSYDR1)], "nbinom")
fn <- fitdist(HRU_PSYDR1[complete.cases(HRU_PSYDR1)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_PSYCH1[complete.cases(HRU_PSYCH1)], histo = TRUE, demp = TRUE)
descdist(HRU_PSYCH1[complete.cases(HRU_PSYCH1)], boot = 1000)
fp <- fitdist(HRU_PSYCH1[complete.cases(HRU_PSYCH1)], "pois")
fnb <- fitdist(HRU_PSYCH1[complete.cases(HRU_PSYCH1)], "nbinom")
fn <- fitdist(HRU_PSYCH1[complete.cases(HRU_PSYCH1)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_PHYSI1[complete.cases(HRU_PHYSI1)], histo = TRUE, demp = TRUE)
descdist(HRU_PHYSI1[complete.cases(HRU_PHYSI1)], boot = 1000)
fp <- fitdist(HRU_PHYSI1[complete.cases(HRU_PHYSI1)], "pois")
fnb <- fitdist(HRU_PHYSI1[complete.cases(HRU_PHYSI1)], "nbinom")
fn <- fitdist(HRU_PHYSI1[complete.cases(HRU_PHYSI1)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_DENT1[complete.cases(HRU_DENT1)], histo = TRUE, demp = TRUE)
descdist(HRU_DENT1[complete.cases(HRU_DENT1)], boot = 1000)
fp <- fitdist(HRU_DENT1[complete.cases(HRU_DENT1)], "pois")
fnb <- fitdist(HRU_DENT1[complete.cases(HRU_DENT1)], "nbinom")
fn <- fitdist(HRU_DENT1[complete.cases(HRU_DENT1)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_SOCWORK1[complete.cases(HRU_SOCWORK1)], histo = TRUE, demp = TRUE)
descdist(HRU_SOCWORK1[complete.cases(HRU_SOCWORK1)], boot = 1000)
fp <- fitdist(HRU_SOCWORK1[complete.cases(HRU_SOCWORK1)], "pois")
fnb <- fitdist(HRU_SOCWORK1[complete.cases(HRU_SOCWORK1)], "nbinom")
fn <- fitdist(HRU_SOCWORK1[complete.cases(HRU_SOCWORK1)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_COMWORK1[complete.cases(HRU_COMWORK1)], histo = TRUE, demp = TRUE)
descdist(HRU_COMWORK1[complete.cases(HRU_COMWORK1)], boot = 1000)
fp <- fitdist(HRU_COMWORK1[complete.cases(HRU_COMWORK1)], "pois")
fnb <- fitdist(HRU_COMWORK1[complete.cases(HRU_COMWORK1)], "nbinom")
fn <- fitdist(HRU_COMWORK1[complete.cases(HRU_COMWORK1)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_GP1[complete.cases(HRU_GP1)], histo = TRUE, demp = TRUE)
descdist(HRU_GP1[complete.cases(HRU_GP1)], boot = 1000)
fp <- fitdist(HRU_GP1[complete.cases(HRU_GP1)], "pois")
fnb <- fitdist(HRU_GP1[complete.cases(HRU_GP1)], "nbinom")
fn <- fitdist(HRU_GP1[complete.cases(HRU_GP1)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_NURSE1[complete.cases(HRU_NURSE1)], histo = TRUE, demp = TRUE)
descdist(HRU_NURSE1[complete.cases(HRU_NURSE1)], boot = 1000)
fp <- fitdist(HRU_NURSE1[complete.cases(HRU_NURSE1)], "pois")
fnb <- fitdist(HRU_NURSE1[complete.cases(HRU_NURSE1)], "nbinom")
fn <- fitdist(HRU_NURSE1[complete.cases(HRU_NURSE1)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_THERAP1[complete.cases(HRU_THERAP1)], histo = TRUE, demp = TRUE)
descdist(HRU_THERAP1[complete.cases(HRU_THERAP1)], boot = 1000)
fp <- fitdist(HRU_THERAP1[complete.cases(HRU_THERAP1)], "pois")
fnb <- fitdist(HRU_THERAP1[complete.cases(HRU_THERAP1)], "nbinom")
fn <- fitdist(HRU_THERAP1[complete.cases(HRU_THERAP1)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_PSYDR0[complete.cases(HRU_PSYDR0)], histo = TRUE, demp = TRUE)
descdist(HRU_PSYDR0[complete.cases(HRU_PSYDR0)], boot = 1000)
fp <- fitdist(HRU_PSYDR0[complete.cases(HRU_PSYDR0)], "pois")
fnb <- fitdist(HRU_PSYDR0[complete.cases(HRU_PSYDR0)], "nbinom")
fn <- fitdist(HRU_PSYDR0[complete.cases(HRU_PSYDR0)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_PSYCH0[complete.cases(HRU_PSYCH0)], histo = TRUE, demp = TRUE)
descdist(HRU_PSYCH0[complete.cases(HRU_PSYCH0)], boot = 1000)
fp <- fitdist(HRU_PSYCH0[complete.cases(HRU_PSYCH0)], "pois")
fnb <- fitdist(HRU_PSYCH0[complete.cases(HRU_PSYCH0)], "nbinom")
fn <- fitdist(HRU_PSYCH0[complete.cases(HRU_PSYCH0)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_PHYSI0[complete.cases(HRU_PHYSI0)], histo = TRUE, demp = TRUE)
descdist(HRU_PHYSI0[complete.cases(HRU_PHYSI0)], boot = 1000)
fp <- fitdist(HRU_PHYSI0[complete.cases(HRU_PHYSI0)], "pois")
fnb <- fitdist(HRU_PHYSI0[complete.cases(HRU_PHYSI0)], "nbinom")
fn <- fitdist(HRU_PHYSI0[complete.cases(HRU_PHYSI0)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_DENT0[complete.cases(HRU_DENT0)], histo = TRUE, demp = TRUE)
descdist(HRU_DENT0[complete.cases(HRU_DENT0)], boot = 1000)
fp <- fitdist(HRU_DENT0[complete.cases(HRU_DENT0)], "pois")
fnb <- fitdist(HRU_DENT0[complete.cases(HRU_DENT0)], "nbinom")
fn <- fitdist(HRU_DENT0[complete.cases(HRU_DENT0)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_SOCWORK0[complete.cases(HRU_SOCWORK0)], histo = TRUE, demp = TRUE)
descdist(HRU_SOCWORK0[complete.cases(HRU_SOCWORK0)], boot = 1000)
fp <- fitdist(HRU_SOCWORK0[complete.cases(HRU_SOCWORK0)], "pois")
fnb <- fitdist(HRU_SOCWORK0[complete.cases(HRU_SOCWORK0)], "nbinom")
fn <- fitdist(HRU_SOCWORK0[complete.cases(HRU_SOCWORK0)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_COMWORK0[complete.cases(HRU_COMWORK0)], histo = TRUE, demp = TRUE)
descdist(HRU_COMWORK0[complete.cases(HRU_COMWORK0)], boot = 1000)
fp <- fitdist(HRU_COMWORK0[complete.cases(HRU_COMWORK0)], "pois")
fnb <- fitdist(HRU_COMWORK0[complete.cases(HRU_COMWORK0)], "nbinom")
fn <- fitdist(HRU_COMWORK0[complete.cases(HRU_COMWORK0)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_GP0[complete.cases(HRU_GP0)], histo = TRUE, demp = TRUE)
descdist(HRU_GP0[complete.cases(HRU_GP0)], boot = 1000)
fp <- fitdist(HRU_GP0[complete.cases(HRU_GP0)], "pois")
fnb <- fitdist(HRU_GP0[complete.cases(HRU_GP0)], "nbinom")
fn <- fitdist(HRU_GP0[complete.cases(HRU_GP0)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_NURSE0[complete.cases(HRU_NURSE0)], histo = TRUE, demp = TRUE)
descdist(HRU_NURSE0[complete.cases(HRU_NURSE0)], boot = 1000)
fp <- fitdist(HRU_NURSE0[complete.cases(HRU_NURSE0)], "pois")
fnb <- fitdist(HRU_NURSE0[complete.cases(HRU_NURSE0)], "nbinom")
fn <- fitdist(HRU_NURSE0[complete.cases(HRU_NURSE0)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

plotdist(HRU_THERAP0[complete.cases(HRU_THERAP0)], histo = TRUE, demp = TRUE)
descdist(HRU_THERAP0[complete.cases(HRU_THERAP0)], boot = 1000)
fp <- fitdist(HRU_THERAP0[complete.cases(HRU_THERAP0)], "pois")
fnb <- fitdist(HRU_THERAP0[complete.cases(HRU_THERAP0)], "nbinom")
fn <- fitdist(HRU_THERAP0[complete.cases(HRU_THERAP0)], "norm")
summary(fp)
summary(fnb)
summary(fn)
par(mfrow = c(2, 2))
plot.legend <- c("Poisson","nbinomial", "normal")
denscomp(list(fp, fnb, fn), legendtext = plot.legend)
qqcomp(list(fp, fnb, fn), legendtext = plot.legend)
cdfcomp(list(fp, fnb, fn), legendtext = plot.legend)
ppcomp(list(fp, fnb, fn), legendtext = plot.legend)

#set up JAGS information and fit models and compare fit (normal, poisson, nbinomial)
library(R2jags)
set.seed(2345)
HRU_PSYDR0 <- round(HRU_PSYDR0, digits = 0)
HRU_PSYDR1 <- round(HRU_PSYDR1, digits = 0)
HRU_PSYDR2 <- round(HRU_PSYDR2, digits = 0)
HRU_PSYCH0 <- round(HRU_PSYCH0, digits = 0)
HRU_PSYCH1 <- round(HRU_PSYCH1, digits = 0)
HRU_PSYCH2 <- round(HRU_PSYCH2, digits = 0)
HRU_PHYSI0 <- round(HRU_PHYSI0, digits = 0)
HRU_PHYSI1 <- round(HRU_PHYSI1, digits = 0)
HRU_PHYSI2 <- round(HRU_PHYSI2, digits = 0)
HRU_DENT0 <- round(HRU_DENT0, digits = 0)
HRU_DENT1 <- round(HRU_DENT1, digits = 0)
HRU_DENT2 <- round(HRU_DENT2, digits = 0)
HRU_SOCWORK0 <- round(HRU_SOCWORK0, digits = 0)
HRU_SOCWORK1 <- round(HRU_SOCWORK1, digits = 0)
HRU_SOCWORK2 <- round(HRU_SOCWORK2, digits = 0)
HRU_COMWORK0 <- round(HRU_COMWORK0, digits = 0)
HRU_COMWORK1 <- round(HRU_COMWORK1, digits = 0)
HRU_COMWORK2 <- round(HRU_COMWORK2, digits = 0)
HRU_GP0 <- round(HRU_GP0, digits = 0)
HRU_GP1 <- round(HRU_GP1, digits = 0)
HRU_GP2 <- round(HRU_GP2, digits = 0)
HRU_NURSE0 <- round(HRU_NURSE0, digits = 0)
HRU_NURSE1 <- round(HRU_NURSE1, digits = 0)
HRU_NURSE2 <- round(HRU_NURSE2, digits = 0)
HRU_THERAP0 <- round(HRU_THERAP0, digits = 0)
HRU_THERAP1 <- round(HRU_THERAP1, digits = 0)
HRU_THERAP2 <- round(HRU_THERAP2, digits = 0)
inits1 <- list(.RNG.name = "base::Wichmann-Hill", .RNG.seed = 1)
inits2 <- list(.RNG.name = "base::Wichmann-Hill", .RNG.seed = 2)

datalist<-list("S0_PSYDR","HRU_PSYDR2","HRU_PSYDR1","HRU_PSYDR0",
               "S0_PSYCH","HRU_PSYCH2","HRU_PSYCH1","HRU_PSYCH0",
               "S0_PHYSI","HRU_PHYSI2","HRU_PHYSI1","HRU_PHYSI0",
               "S0_DENT","HRU_DENT2","HRU_DENT1","HRU_DENT0",
               "S0_SOCWORK","HRU_SOCWORK2","HRU_SOCWORK1","HRU_SOCWORK0",
               "S0_COMWORK","HRU_COMWORK2","HRU_COMWORK1","HRU_COMWORK0",
                "HRU_GP2","HRU_GP1","HRU_GP0",
               "S0_NURSE","HRU_NURSE2","HRU_NURSE1","HRU_NURSE0",
               "S0_THERAP","HRU_THERAP2","HRU_THERAP1","HRU_THERAP0",
               "N","group")
params<-c("alpha0_PSYDR","alpha1_PSYDR","alpha2_PSYDR","gamma0_PSYDR","gamma1_PSYDR","psi_S0PSYDR",
          "mu_PSYDR0","mu_PSYDR1","mu_PSYDR2","sd_PSYDR1","sd_PSYDR2","log_lik_PSYDR1","log_lik_PSYDR2",
          "alpha0_PSYCH","alpha1_PSYCH","alpha2_PSYCH","gamma0_PSYCH","gamma1_PSYCH","psi_S0PSYCH",
          "mu_PSYCH0","mu_PSYCH1","mu_PSYCH2","sd_PSYCH1","sd_PSYCH2","log_lik_PSYCH1","log_lik_PSYCH2",
          "alpha0_PHYSI","alpha1_PHYSI","alpha2_PHYSI","gamma0_PHYSI","gamma1_PHYSI","psi_S0PHYSI",
          "mu_PHYSI0","mu_PHYSI1","mu_PHYSI2","sd_PHYSI1","sd_PHYSI2","log_lik_PHYSI1","log_lik_PHYSI2",
          "alpha0_DENT","alpha1_DENT","alpha2_DENT","gamma0_DENT","gamma1_DENT","psi_S0DENT",
          "mu_DENT0","mu_DENT1","mu_DENT2","sd_DENT1","sd_DENT2","log_lik_DENT1","log_lik_DENT2",
          "alpha0_SOCWORK","alpha1_SOCWORK","alpha2_SOCWORK","gamma0_SOCWORK","gamma1_SOCWORK","psi_S0SOCWORK",
          "mu_SOCWORK0","mu_SOCWORK1","mu_SOCWORK2","sd_SOCWORK1","sd_SOCWORK2","log_lik_SOCWORK1","log_lik_SOCWORK2",
          "alpha0_COMWORK","alpha1_COMWORK","alpha2_COMWORK","gamma0_COMWORK","gamma1_COMWORK","psi_S0COMWORK",
          "mu_COMWORK0","mu_COMWORK1","mu_COMWORK2","sd_COMWORK1","sd_COMWORK2","log_lik_COMWORK1","log_lik_COMWORK2",
          "alpha0_GP","alpha1_GP","alpha2_GP",
          "mu_GP0","mu_GP1","mu_GP2","sd_GP1","sd_GP2","log_lik_GP1","log_lik_GP2",
          "alpha0_NURSE","alpha1_NURSE","alpha2_NURSE","gamma0_NURSE","gamma1_NURSE","psi_S0NURSE",
          "mu_NURSE0","mu_NURSE1","mu_NURSE2","sd_NURSE1","sd_NURSE2","log_lik_NURSE1","log_lik_NURSE2",
          "alpha0_THERAP","alpha1_THERAP","alpha2_THERAP","gamma0_THERAP","gamma1_THERAP","psi_S0THERAP",
          "mu_THERAP0","mu_THERAP1","mu_THERAP2","sd_THERAP1","sd_THERAP2","log_lik_THERAP1","log_lik_THERAP2")
filein<-"HRU_model_norm_v1.txt"
n.iter<-20000
jagsModel_norm<-jags(data=datalist,inits=list(inits1,inits2),parameters.to.save=params,model.file=filein,
                n.chains=2,n.iter=n.iter,n.thin=1)

datalist<-list("S0_PSYDR","HRU_PSYDR2","HRU_PSYDR1","HRU_PSYDR0",
               "S0_PSYCH","HRU_PSYCH2","HRU_PSYCH1","HRU_PSYCH0",
               "S0_PHYSI","HRU_PHYSI2","HRU_PHYSI1","HRU_PHYSI0",
               "S0_DENT","HRU_DENT2","HRU_DENT1","HRU_DENT0",
               "S0_SOCWORK","HRU_SOCWORK2","HRU_SOCWORK1","HRU_SOCWORK0",
               "S0_COMWORK","HRU_COMWORK2","HRU_COMWORK1","HRU_COMWORK0",
               "HRU_GP2","HRU_GP1","HRU_GP0",
               "S0_NURSE","HRU_NURSE2","HRU_NURSE1","HRU_NURSE0",
               "S0_THERAP","HRU_THERAP2","HRU_THERAP1","HRU_THERAP0",
               "N","group")
params<-c("alpha0_PSYDR","alpha1_PSYDR","alpha2_PSYDR","gamma0_PSYDR","gamma1_PSYDR","psi_S0PSYDR",
          "mu_PSYDR0","mu_PSYDR1","mu_PSYDR2","log_lik_PSYDR1","log_lik_PSYDR2",
          "alpha0_PSYCH","alpha1_PSYCH","alpha2_PSYCH","gamma0_PSYCH","gamma1_PSYCH","psi_S0PSYCH",
          "mu_PSYCH0","mu_PSYCH1","mu_PSYCH2","log_lik_PSYCH1","log_lik_PSYCH2",
          "alpha0_PHYSI","alpha1_PHYSI","alpha2_PHYSI","gamma0_PHYSI","gamma1_PHYSI","psi_S0PHYSI",
          "mu_PHYSI0","mu_PHYSI1","mu_PHYSI2","log_lik_PHYSI1","log_lik_PHYSI2",
          "alpha0_DENT","alpha1_DENT","alpha2_DENT","gamma0_DENT","gamma1_DENT","psi_S0DENT",
          "mu_DENT0","mu_DENT1","mu_DENT2","log_lik_DENT1","log_lik_DENT2",
          "alpha0_SOCWORK","alpha1_SOCWORK","alpha2_SOCWORK","gamma0_SOCWORK","gamma1_SOCWORK","psi_S0SOCWORK",
          "mu_SOCWORK0","mu_SOCWORK1","mu_SOCWORK2","log_lik_SOCWORK1","log_lik_SOCWORK2",
          "alpha0_COMWORK","alpha1_COMWORK","alpha2_COMWORK","gamma0_COMWORK","gamma1_COMWORK","psi_S0COMWORK",
          "mu_COMWORK0","mu_COMWORK1","mu_COMWORK2","log_lik_COMWORK1","log_lik_COMWORK2",
          "alpha0_GP","alpha1_GP","alpha2_GP","gamma0_GP","gamma1_GP","psi_non_S0GP0","psi_non_S0GP1","psi_non_S0GP2",
          "mu_GP1","mu_GP2","log_lik_GP1","log_lik_GP2",
          "alpha0_NURSE","alpha1_NURSE","alpha2_NURSE","gamma0_NURSE","gamma1_NURSE","psi_S0NURSE",
          "mu_NURSE0","mu_NURSE1","mu_NURSE2","log_lik_NURSE1","log_lik_NURSE2",
          "alpha0_THERAP","alpha1_THERAP","alpha2_THERAP","gamma0_THERAP","gamma1_THERAP","psi_S0THERAP",
          "mu_THERAP0","mu_THERAP1","mu_THERAP2","log_lik_THERAP1","log_lik_THERAP2")
filein<-"HRU_model_pois_v2.txt"
n.iter<-20000
jagsModel_pois<-jags(data=datalist,inits=list(inits1,inits2),parameters.to.save=params,model.file=filein,
                     n.chains=2,n.iter=n.iter,n.thin=1)

datalist<-list("S0_PSYDR","HRU_PSYDR2","HRU_PSYDR1","HRU_PSYDR0",
               "S0_PSYCH","HRU_PSYCH2","HRU_PSYCH1","HRU_PSYCH0",
               "S0_PHYSI","HRU_PHYSI2","HRU_PHYSI1","HRU_PHYSI0",
               "S0_DENT","HRU_DENT2","HRU_DENT1","HRU_DENT0",
               "S0_SOCWORK","HRU_SOCWORK2","HRU_SOCWORK1","HRU_SOCWORK0",
               "S0_COMWORK","HRU_COMWORK2","HRU_COMWORK1","HRU_COMWORK0",
               "non_S0_GP0","non_S0_GP1","non_S0_GP2","HRU_GP2","HRU_GP1","HRU_GP0",
               "S0_NURSE","HRU_NURSE2","HRU_NURSE1","HRU_NURSE0",
               "S0_THERAP","HRU_THERAP2","HRU_THERAP1","HRU_THERAP0",
               "N","group")
params<-c("alpha0_PSYDR","alpha1_PSYDR","alpha2_PSYDR","gamma0_PSYDR","gamma1_PSYDR","psi_S0PSYDR",
          "mu_PSYDR0","mu_PSYDR1","mu_PSYDR2","r_PSYDR0","r_PSYDR1","r_PSYDR2","log_lik_PSYDR1","log_lik_PSYDR2",
          "alpha0_PSYCH","alpha1_PSYCH","alpha2_PSYCH","gamma0_PSYCH","gamma1_PSYCH","psi_S0PSYCH",
          "mu_PSYCH0","mu_PSYCH1","mu_PSYCH2","r_PSYCH0","r_PSYCH1","r_PSYCH2","log_lik_PSYCH1","log_lik_PSYCH2",
          "alpha0_PHYSI","alpha1_PHYSI","alpha2_PHYSI","gamma0_PHYSI","gamma1_PHYSI","psi_S0PHYSI",
          "mu_PHYSI0","mu_PHYSI1","mu_PHYSI2","r_PHYSI0","r_PHYSI1","r_PHYSI2",
          "alpha0_DENT","alpha1_DENT","alpha2_DENT","gamma0_DENT","gamma1_DENT","psi_S0DENT",
          "mu_DENT0","mu_DENT1","mu_DENT2","r_DENT0","r_DENT1","r_DENT2","log_lik_DENT1","log_lik_DENT2",
          "alpha0_SOCWORK","alpha1_SOCWORK","alpha2_SOCWORK","gamma0_SOCWORK","gamma1_SOCWORK","psi_S0SOCWORK",
          "mu_SOCWORK0","mu_SOCWORK1","mu_SOCWORK2","r_SOCWORK0","r_SOCWORK1","r_SOCWORK2","log_lik_SOCWORK1","log_lik_SOCWORK2",
          "alpha0_COMWORK","alpha1_COMWORK","alpha2_COMWORK","gamma0_COMWORK","gamma1_COMWORK","psi_S0COMWORK",
          "mu_COMWORK1","mu_COMWORK2","r_COMWORK1","r_COMWORK2",
          "alpha0_GP","alpha1_GP","alpha2_GP","gamma0_GP","gamma1_GP","psi_non_S0GP0","psi_non_S0GP1","psi_non_S0GP2",
          "mu_GP0","mu_GP1","mu_GP2","r_GP0","r_GP1","r_GP2",
          "alpha0_NURSE","alpha1_NURSE","alpha2_NURSE","gamma0_NURSE","gamma1_NURSE","psi_S0NURSE",
          "mu_NURSE0","mu_NURSE1","mu_NURSE2","r_NURSE0","r_NURSE1","r_NURSE2","log_lik_NURSE1","log_lik_NURSE2",
          "alpha0_THERAP","alpha1_THERAP","alpha2_THERAP","gamma0_THERAP","gamma1_THERAP","psi_S0THERAP",
          "mu_THERAP0","mu_THERAP1","mu_THERAP2","r_THERAP0","r_THERAP1","r_THERAP2","log_lik_THERAP1","log_lik_THERAP2")
filein<-"HRU_model_nbinom_v2.txt"
n.iter<-20000
jagsModel_nbinom<-jags(data=datalist,inits=list(inits1,inits2),parameters.to.save=params,model.file=filein,
                      n.chains=2,n.iter=n.iter,n.thin=1)

#saveRDS(jagsModel_norm,"jagsModel_norm.rds")
#saveRDS(jagsModel_pois,"jagsModel_pois.rds")
#saveRDS(jagsModel_nbinom,"jagsModel_nbinom.rds")

jagsModel_norm <- readRDS("jagsModel_norm.rds")
jagsModel_pois <- readRDS("jagsModel_pois.rds")
jagsModel_nbinom <- readRDS("jagsModel_nbinom.rds")

#data for joint model
EQ5D0 <- PBS_dataset_quest$eq5d0_proxy
EQ5D1 <- PBS_dataset_quest$eq5d1_proxy
EQ5D2 <- PBS_dataset_quest$eq5d2_proxy
QALY <- (EQ5D0+EQ5D1)*0.5/2 + (EQ5D1+EQ5D2)*0.5/2
#mu_beta_EQ5D0 <- mu_beta_EQ5D1 <- mu_beta_EQ5D2 <- rep(0, 9)
#SIGMA_beta_EQ5D0 <- SIGMA_beta_EQ5D1 <- SIGMA_beta_EQ5D2 <- diag(9)
datalist<-list("S0_PSYDR","HRU_PSYDR2","HRU_PSYDR1","HRU_PSYDR0",
               "S0_PSYCH","HRU_PSYCH2","HRU_PSYCH1","HRU_PSYCH0",
               "S0_PHYSI","HRU_PHYSI2","HRU_PHYSI1","HRU_PHYSI0",
               "S0_DENT","HRU_DENT2","HRU_DENT1","HRU_DENT0",
               "S0_SOCWORK","HRU_SOCWORK2","HRU_SOCWORK1","HRU_SOCWORK0",
               "S0_COMWORK","HRU_COMWORK2","HRU_COMWORK1","HRU_COMWORK0",
               "HRU_GP2","HRU_GP1","HRU_GP0",
               "S0_NURSE","HRU_NURSE2","HRU_NURSE1","HRU_NURSE0",
               "S0_THERAP","HRU_THERAP2","HRU_THERAP1","HRU_THERAP0",
               "N","group","EQ5D0","EQ5D1","EQ5D2")
params<-c("alpha0_PSYDR","alpha1_PSYDR","alpha2_PSYDR","gamma0_PSYDR","gamma1_PSYDR","psi_S0PSYDR",
          "mu_PSYDR0","mu_PSYDR1","mu_PSYDR2","sd_PSYDR1","sd_PSYDR2",
          "alpha0_PSYCH","alpha1_PSYCH","alpha2_PSYCH","gamma0_PSYCH","gamma1_PSYCH","psi_S0PSYCH",
          "mu_PSYCH0","mu_PSYCH1","mu_PSYCH2","sd_PSYCH1","sd_PSYCH2",
          "alpha0_PHYSI","alpha1_PHYSI","alpha2_PHYSI","gamma0_PHYSI","gamma1_PHYSI","psi_S0PHYSI",
          "mu_PHYSI0","mu_PHYSI1","mu_PHYSI2","sd_PHYSI1","sd_PHYSI2",
          "alpha0_DENT","alpha1_DENT","alpha2_DENT","gamma0_DENT","gamma1_DENT","psi_S0DENT",
          "mu_DENT0","mu_DENT1","mu_DENT2","sd_DENT1","sd_DENT2",
          "alpha0_SOCWORK","alpha1_SOCWORK","alpha2_SOCWORK","gamma0_SOCWORK","gamma1_SOCWORK","psi_S0SOCWORK",
          "mu_SOCWORK0","mu_SOCWORK1","mu_SOCWORK2","sd_SOCWORK1","sd_SOCWORK2",
          "alpha0_COMWORK","alpha1_COMWORK","alpha2_COMWORK","gamma0_COMWORK","gamma1_COMWORK","psi_S0COMWORK",
          "mu_COMWORK0","mu_COMWORK1","mu_COMWORK2","sd_COMWORK1","sd_COMWORK2",
          "alpha0_GP","alpha1_GP","alpha2_GP",
          "mu_GP0","mu_GP1","mu_GP2","sd_GP1","sd_GP2","log_lik_GP1","log_lik_GP2",
          "alpha0_NURSE","alpha1_NURSE","alpha2_NURSE","gamma0_NURSE","gamma1_NURSE","psi_S0NURSE",
          "mu_NURSE0","mu_NURSE1","mu_NURSE2","sd_NURSE1","sd_NURSE2",
          "alpha0_THERAP","alpha1_THERAP","alpha2_THERAP","gamma0_THERAP","gamma1_THERAP","psi_S0THERAP",
          "mu_THERAP0","mu_THERAP1","mu_THERAP2","sd_THERAP1","sd_THERAP2",
          "beta0_EQ5D","beta1_EQ5D","beta2_EQ5D","beta_EQ5D0","beta_EQ5D1","beta_EQ5D2",
          "mu_EQ5D0","mu_EQ5D1","mu_EQ5D2","sd_EQ5D0","sd_EQ5D1","sd_EQ5D2")
filein<-"HRU_model_pois_vfinal.txt"
n.iter<-20000
jagsModel_pois_final<-jags(data=datalist,inits=list(inits1,inits2),parameters.to.save=params,model.file=filein,
                            n.chains=2,n.iter=n.iter,n.thin=1)



#check model convergence
library(mcmcplots)
library(ggmcmc)
library(mcmcr)
mcmcplot(jagsModel_norm, parms = c("alpha0_PSYDR","alpha1_PSYDR","alpha2_PSYDR","gamma0_PSYDR","gamma1_PSYDR"), style = "plain")
mcmcplot(jagsModel_norm, parms = c("alpha0_PSYCH","alpha1_PSYCH","alpha2_PSYCH","gamma0_PSYCH","gamma1_PSYCH"), style = "plain")
mcmcplot(jagsModel_norm, parms = c("alpha0_PHYSI","alpha1_PHYSI","alpha2_PHYSI","gamma0_PHYSI","gamma1_PHYSI"), style = "plain")
mcmcplot(jagsModel_norm, parms = c("alpha0_DENT","alpha1_DENT","alpha2_DENT","gamma0_DENT","gamma1_DENT"), style = "plain")
mcmcplot(jagsModel_norm, parms = c("alpha0_SOCWORK","alpha1_SOCWORK","alpha2_SOCWORK","gamma0_SOCWORK","gamma1_SOCWORK"), style = "plain")
mcmcplot(jagsModel_norm, parms = c("alpha0_COMWORK","alpha1_COMWORK","alpha2_COMWORK","gamma0_COMWORK","gamma1_COMWORK"), style = "plain")
mcmcplot(jagsModel_norm, parms = c("alpha0_GP","alpha1_GP","alpha2_GP"), style = "plain")
mcmcplot(jagsModel_norm, parms = c("alpha0_NURSE","alpha1_NURSE","alpha2_NURSE","gamma0_NURSE","gamma1_NURSE"), style = "plain")
mcmcplot(jagsModel_norm, parms = c("alpha0_THERAP","alpha1_THERAP","alpha2_THERAP","gamma0_THERAP","gamma1_THERAP"), style = "plain")
#alpha0_NURSE and alpha1_NURSE show some troubles
jagsModel2_mcmcobject <- coda::as.mcmc(jagsModel_norm)
params_check_norm <- c("alpha0_NURSE","alpha1_NURSE","alpha2_NURSE","gamma0_NURSE","gamma1_NURSE")
jagsModel2_mcmcsubset <- subset(jagsModel2_mcmcobject, pars = params_check_norm)
jagsModel2_ggmcmc_object <- ggmcmc::ggs(jagsModel2_mcmcsubset)
ggmcmc::ggs_Rhat(jagsModel2_ggmcmc_object, family = "alpha1_NURSE")
ggmcmc::ggs_Rhat(jagsModel2_ggmcmc_object, family = "alpha0_NURSE")
ggmcmc::ggs_histogram(jagsModel2_ggmcmc_object, family = "alpha1_NURSE")
ggmcmc::ggs_histogram(jagsModel2_ggmcmc_object, family = "alpha0_NURSE")
ggmcmc::ggs_density(jagsModel2_ggmcmc_object, family = "alpha1_NURSE")
ggmcmc::ggs_density(jagsModel2_ggmcmc_object, family = "alpha0_NURSE")
ggmcmc::ggs_traceplot(jagsModel2_ggmcmc_object, family = "alpha1_NURSE")
ggmcmc::ggs_traceplot(jagsModel2_ggmcmc_object, family = "alpha0_NURSE")
ggmcmc::ggs_autocorrelation(jagsModel2_ggmcmc_object, family = "alpha1_NURSE")
ggmcmc::ggs_autocorrelation(jagsModel2_ggmcmc_object, family = "alpha0_NURSE")
ggmcmc::ggs_caterpillar(jagsModel2_ggmcmc_object, family = "alpha1_NURSE")
ggmcmc::ggs_caterpillar(jagsModel2_ggmcmc_object, family = "alpha0_NURSE")

mcmcplot(jagsModel_pois, parms = c("alpha0_PSYDR","alpha1_PSYDR","alpha2_PSYDR","gamma0_PSYDR","gamma1_PSYDR"), style = "plain")
mcmcplot(jagsModel_pois, parms = c("alpha0_PSYCH","alpha1_PSYCH","alpha2_PSYCH","gamma0_PSYCH","gamma1_PSYCH"), style = "plain")
mcmcplot(jagsModel_pois, parms = c("alpha0_PHYSI","alpha1_PHYSI","alpha2_PHYSI","gamma0_PHYSI","gamma1_PHYSI"), style = "plain")
mcmcplot(jagsModel_pois, parms = c("alpha0_DENT","alpha1_DENT","alpha2_DENT","gamma0_DENT","gamma1_DENT"), style = "plain")
mcmcplot(jagsModel_pois, parms = c("alpha0_SOCWORK","alpha1_SOCWORK","alpha2_SOCWORK","gamma0_SOCWORK","gamma1_SOCWORK"), style = "plain")
mcmcplot(jagsModel_pois, parms = c("alpha0_COMWORK","alpha1_COMWORK","alpha2_COMWORK","gamma0_COMWORK","gamma1_COMWORK"), style = "plain")
mcmcplot(jagsModel_pois, parms = c("alpha0_GP","alpha1_GP","alpha2_GP"), style = "plain")
mcmcplot(jagsModel_pois, parms = c("alpha0_NURSE","alpha1_NURSE","alpha2_NURSE","gamma0_NURSE","gamma1_NURSE"), style = "plain")
mcmcplot(jagsModel_pois, parms = c("alpha0_THERAP","alpha1_THERAP","alpha2_THERAP","gamma0_THERAP","gamma1_THERAP"), style = "plain")


mcmcplot(jagsModel_nbinom, parms = c("alpha0_PSYDR","alpha1_PSYDR","alpha2_PSYDR","gamma0_PSYDR","gamma1_PSYDR"), style = "plain")
mcmcplot(jagsModel_nbinom, parms = c("alpha0_PSYCH","alpha1_PSYCH","alpha2_PSYCH","gamma0_PSYCH","gamma1_PSYCH"), style = "plain")
mcmcplot(jagsModel_nbinom, parms = c("alpha0_PHYSI","alpha1_PHYSI","alpha2_PHYSI","gamma0_PHYSI","gamma1_PHYSI"), style = "plain")
mcmcplot(jagsModel_nbinom, parms = c("alpha0_DENT","alpha1_DENT","alpha2_DENT","gamma0_DENT","gamma1_DENT"), style = "plain")
mcmcplot(jagsModel_nbinom, parms = c("alpha0_SOCWORK","alpha1_SOCWORK","alpha2_SOCWORK","gamma0_SOCWORK","gamma1_SOCWORK"), style = "plain")
mcmcplot(jagsModel_nbinom, parms = c("alpha0_COMWORK","alpha1_COMWORK","alpha2_COMWORK","gamma0_COMWORK","gamma1_COMWORK"), style = "plain")
mcmcplot(jagsModel_nbinom, parms = c("alpha0_GP","alpha1_GP","alpha2_GP"), style = "plain")
mcmcplot(jagsModel_nbinom, parms = c("alpha0_NURSE","alpha1_NURSE","alpha2_NURSE","gamma0_NURSE","gamma1_NURSE"), style = "plain")
mcmcplot(jagsModel_nbinom, parms = c("alpha0_THERAP","alpha1_THERAP","alpha2_THERAP","gamma0_THERAP","gamma1_THERAP"), style = "plain")
#alpha0_GP and alpha2_GP show some troubles

jagsModel2_mcmcobject <- coda::as.mcmc(jagsModel_nbinom)
params_check_nbinom <- c("alpha0_GP","alpha1_GP","alpha2_GP")
jagsModel2_mcmcsubset <- subset(jagsModel2_mcmcobject, pars = params_check_nbinom)
jagsModel2_ggmcmc_object <- ggmcmc::ggs(jagsModel2_mcmcsubset)
ggmcmc::ggs_Rhat(jagsModel2_ggmcmc_object, family = "alpha2_GP")
ggmcmc::ggs_Rhat(jagsModel2_ggmcmc_object, family = "alpha0_GP")
ggmcmc::ggs_histogram(jagsModel2_ggmcmc_object, family = "alpha2_GP")
ggmcmc::ggs_histogram(jagsModel2_ggmcmc_object, family = "alpha0_GP")
ggmcmc::ggs_density(jagsModel2_ggmcmc_object, family = "alpha2_GP")
ggmcmc::ggs_density(jagsModel2_ggmcmc_object, family = "alpha0_GP")
ggmcmc::ggs_traceplot(jagsModel2_ggmcmc_object, family = "alpha2_GP")
ggmcmc::ggs_traceplot(jagsModel2_ggmcmc_object, family = "alpha0_GP")
ggmcmc::ggs_autocorrelation(jagsModel2_ggmcmc_object, family = "alpha2_GP")
ggmcmc::ggs_autocorrelation(jagsModel2_ggmcmc_object, family = "alpha0_GP")
ggmcmc::ggs_caterpillar(jagsModel2_ggmcmc_object, family = "alpha2_GP")
ggmcmc::ggs_caterpillar(jagsModel2_ggmcmc_object, family = "alpha0_GP")

res_s3_method1 <- readRDS("res_s3_method1.rds")
jagsModel_pois <- res_s3_method1$res_s2_method1_pois$jagsModel_pois
jagsModel_nbinom <- res_s3_method1$res_s2_method1_nbinom$jagsModel_nbinom
jagsModel_norm <- res_s3_method1$res_s2_method1_norm$jagsModel_norm

#compare model fit via IC and PPC
library(loo)
log_lik_PSYDR1_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_PSYDR1
log_lik_PSYDR2_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_PSYDR2
ic_waic_PSYDR1_norm <- waic(log_lik_PSYDR1_norm)
ic_waic_PSYDR2_norm <- waic(log_lik_PSYDR2_norm)
ic_looic_PSYDR1_norm <- loo(log_lik_PSYDR1_norm)
ic_looic_PSYDR2_norm <- loo(log_lik_PSYDR2_norm)
ic_waic_norm_PSYDR <- ic_waic_PSYDR1_norm$estimates[,1] + ic_waic_PSYDR2_norm$estimates[,1]
ic_looic_norm_PSYDR <- ic_looic_PSYDR1_norm$estimates[,1] + ic_looic_PSYDR2_norm$estimates[,1]
log_lik_PSYCH1_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_PSYCH1
log_lik_PSYCH2_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_PSYCH2
ic_waic_PSYCH1_norm <- waic(log_lik_PSYCH1_norm)
ic_waic_PSYCH2_norm <- waic(log_lik_PSYCH2_norm)
ic_looic_PSYCH1_norm <- loo(log_lik_PSYCH1_norm)
ic_looic_PSYCH2_norm <- loo(log_lik_PSYCH2_norm)
ic_waic_norm_PSYCH <- ic_waic_PSYCH1_norm$estimates[,1] + ic_waic_PSYCH2_norm$estimates[,1]
ic_looic_norm_PSYCH <- ic_looic_PSYCH1_norm$estimates[,1] + ic_looic_PSYCH2_norm$estimates[,1]
log_lik_PHYSI1_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_PHYSI1
log_lik_PHYSI2_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_PHYSI2
ic_waic_PHYSI1_norm <- waic(log_lik_PHYSI1_norm)
ic_waic_PHYSI2_norm <- waic(log_lik_PHYSI2_norm)
ic_looic_PHYSI1_norm <- loo(log_lik_PHYSI1_norm)
ic_looic_PHYSI2_norm <- loo(log_lik_PHYSI2_norm)
ic_waic_norm_PHYSI <- ic_waic_PHYSI1_norm$estimates[,1] + ic_waic_PHYSI2_norm$estimates[,1]
ic_looic_norm_PHYSI <- ic_looic_PHYSI1_norm$estimates[,1] + ic_looic_PHYSI2_norm$estimates[,1]
log_lik_DENT1_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_DENT1
log_lik_DENT2_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_DENT2
ic_waic_DENT1_norm <- waic(log_lik_DENT1_norm)
ic_waic_DENT2_norm <- waic(log_lik_DENT2_norm)
ic_looic_DENT1_norm <- loo(log_lik_DENT1_norm)
ic_looic_DENT2_norm <- loo(log_lik_DENT2_norm)
ic_waic_norm_DENT <- ic_waic_DENT1_norm$estimates[,1] + ic_waic_DENT2_norm$estimates[,1]
ic_looic_norm_DENT <- ic_looic_DENT1_norm$estimates[,1] + ic_looic_DENT2_norm$estimates[,1]
log_lik_SOCWORK1_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_SOCWORK1
log_lik_SOCWORK2_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_SOCWORK2
ic_waic_SOCWORK1_norm <- waic(log_lik_SOCWORK1_norm)
ic_waic_SOCWORK2_norm <- waic(log_lik_SOCWORK2_norm)
ic_looic_SOCWORK1_norm <- loo(log_lik_SOCWORK1_norm)
ic_looic_SOCWORK2_norm <- loo(log_lik_SOCWORK2_norm)
ic_waic_norm_SOCWORK <- ic_waic_SOCWORK1_norm$estimates[,1] + ic_waic_SOCWORK2_norm$estimates[,1]
ic_looic_norm_SOCWORK <- ic_looic_SOCWORK1_norm$estimates[,1] + ic_looic_SOCWORK2_norm$estimates[,1]
log_lik_COMWORK1_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_COMWORK1
log_lik_COMWORK2_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_COMWORK2
ic_waic_COMWORK1_norm <- waic(log_lik_COMWORK1_norm)
ic_waic_COMWORK2_norm <- waic(log_lik_COMWORK2_norm)
ic_looic_COMWORK1_norm <- loo(log_lik_COMWORK1_norm)
ic_looic_COMWORK2_norm <- loo(log_lik_COMWORK2_norm)
ic_waic_norm_COMWORK <- ic_waic_COMWORK1_norm$estimates[,1] + ic_waic_COMWORK2_norm$estimates[,1]
ic_looic_norm_COMWORK <- ic_looic_COMWORK1_norm$estimates[,1] + ic_looic_COMWORK2_norm$estimates[,1]
log_lik_GP1_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_GP1
log_lik_GP2_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_GP2
ic_waic_GP1_norm <- waic(log_lik_GP1_norm)
ic_waic_GP2_norm <- waic(log_lik_GP2_norm)
ic_looic_GP1_norm <- loo(log_lik_GP1_norm)
ic_looic_GP2_norm <- loo(log_lik_GP2_norm)
ic_waic_norm_GP <- ic_waic_GP1_norm$estimates[,1] + ic_waic_GP2_norm$estimates[,1]
ic_looic_norm_GP <- ic_looic_GP1_norm$estimates[,1] + ic_looic_GP2_norm$estimates[,1]
log_lik_NURSE1_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_NURSE1
log_lik_NURSE2_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_NURSE2
ic_waic_NURSE1_norm <- waic(log_lik_NURSE1_norm)
ic_waic_NURSE2_norm <- waic(log_lik_NURSE2_norm)
ic_looic_NURSE1_norm <- loo(log_lik_NURSE1_norm)
ic_looic_NURSE2_norm <- loo(log_lik_NURSE2_norm)
ic_waic_norm_NURSE <- ic_waic_NURSE1_norm$estimates[,1] + ic_waic_NURSE2_norm$estimates[,1]
ic_looic_norm_NURSE <- ic_looic_NURSE1_norm$estimates[,1] + ic_looic_NURSE2_norm$estimates[,1]
log_lik_THERAP1_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_THERAP1
log_lik_THERAP2_norm <- jagsModel_norm$BUGSoutput$sims.list$log_lik_THERAP2
ic_waic_THERAP1_norm <- waic(log_lik_THERAP1_norm)
ic_waic_THERAP2_norm <- waic(log_lik_THERAP2_norm)
ic_looic_THERAP1_norm <- loo(log_lik_THERAP1_norm)
ic_looic_THERAP2_norm <- loo(log_lik_THERAP2_norm)
ic_waic_norm_THERAP <- ic_waic_THERAP1_norm$estimates[,1] + ic_waic_THERAP2_norm$estimates[,1]
ic_looic_norm_THERAP <- ic_looic_THERAP1_norm$estimates[,1] + ic_looic_THERAP2_norm$estimates[,1]

ic_waic_norm <- ic_waic_norm_PSYDR + ic_waic_norm_PSYCH + ic_waic_norm_PHYSI + 
  ic_waic_norm_DENT + ic_waic_norm_SOCWORK + ic_waic_norm_COMWORK + ic_waic_norm_GP +
  ic_waic_norm_NURSE + ic_waic_norm_THERAP
ic_looic_norm <- ic_looic_norm_PSYDR + ic_looic_norm_PSYCH + ic_looic_norm_PHYSI + 
  ic_looic_norm_DENT + ic_looic_norm_SOCWORK + ic_looic_norm_COMWORK + ic_looic_norm_GP +
  ic_looic_norm_NURSE + ic_looic_norm_THERAP


log_lik_PSYDR1_pois <- jagsModel_pois$BUGSoutput$sims.list$log_lik_PSYDR1
log_lik_PSYDR2_pois <- jagsModel_pois$BUGSoutput$sims.list$log_lik_PSYDR2
ic_waic_PSYDR1_pois <- waic(log_lik_PSYDR1_pois)
ic_waic_PSYDR2_pois <- waic(log_lik_PSYDR2_pois)
ic_looic_PSYDR1_pois <- loo(log_lik_PSYDR1_pois)
ic_looic_PSYDR2_pois <- loo(log_lik_PSYDR2_pois)
ic_waic_pois_PSYDR <- ic_waic_PSYDR1_pois$estimates[,1] + ic_waic_PSYDR2_pois$estimates[,1]
ic_looic_pois_PSYDR <- ic_looic_PSYDR1_pois$estimates[,1] + ic_looic_PSYDR2_pois$estimates[,1]
log_lik_PSYCH1_pois <- jagsModel_pois$BUGSoutput$sims.list$log_lik_PSYCH1
log_lik_PSYCH2_pois <- jagsModel_pois$BUGSoutput$sims.list$log_lik_PSYCH2
ic_waic_PSYCH1_pois <- waic(log_lik_PSYCH1_pois)
ic_waic_PSYCH2_pois <- waic(log_lik_PSYCH2_pois)
ic_looic_PSYCH1_pois <- loo(log_lik_PSYCH1_pois)
ic_looic_PSYCH2_pois <- loo(log_lik_PSYCH2_pois)
ic_waic_pois_PSYCH <- ic_waic_PSYCH1_pois$estimates[,1] + ic_waic_PSYCH2_pois$estimates[,1]
ic_looic_pois_PSYCH <- ic_looic_PSYCH1_pois$estimates[,1] + ic_looic_PSYCH2_pois$estimates[,1]
log_lik_PHYSI1_pois <- jagsModel_pois$BUGSoutput$sims.list$log_lik_PHYSI1
log_lik_PHYSI2_pois <- jagsModel_pois$BUGSoutput$sims.list$log_lik_PHYSI2
ic_waic_PHYSI1_pois <- waic(log_lik_PHYSI1_pois)
ic_waic_PHYSI2_pois <- waic(log_lik_PHYSI2_pois)
ic_looic_PHYSI1_pois <- loo(log_lik_PHYSI1_pois)
ic_looic_PHYSI2_pois <- loo(log_lik_PHYSI2_pois)
ic_waic_pois_PHYSI <- ic_waic_PHYSI1_pois$estimates[,1] + ic_waic_PHYSI2_pois$estimates[,1]
ic_looic_pois_PHYSI <- ic_looic_PHYSI1_pois$estimates[,1] + ic_looic_PHYSI2_pois$estimates[,1]
log_lik_DENT1_pois <- jagsModel_pois$BUGSoutput$sims.list$log_lik_DENT1
log_lik_DENT2_pois <- jagsModel_pois$BUGSoutput$sims.list$log_lik_DENT2
ic_waic_DENT1_pois <- waic(log_lik_DENT1_pois)
ic_waic_DENT2_pois <- waic(log_lik_DENT2_pois)
ic_looic_DENT1_pois <- loo(log_lik_DENT1_pois)
ic_looic_DENT2_pois <- loo(log_lik_DENT2_pois)
ic_waic_pois_DENT <- ic_waic_DENT1_pois$estimates[,1] + ic_waic_DENT2_pois$estimates[,1]
ic_looic_pois_DENT <- ic_looic_DENT1_pois$estimates[,1] + ic_looic_DENT2_pois$estimates[,1]
log_lik_SOCWORK1_pois <- jagsModel_pois$BUGSoutput$sims.list$log_lik_SOCWORK1
log_lik_SOCWORK2_pois <- jagsModel_pois$BUGSoutput$sims.list$log_lik_SOCWORK2
ic_waic_SOCWORK1_pois <- waic(log_lik_SOCWORK1_pois)
ic_waic_SOCWORK2_pois <- waic(log_lik_SOCWORK2_pois)
ic_looic_SOCWORK1_pois <- loo(log_lik_SOCWORK1_pois)
ic_looic_SOCWORK2_pois <- loo(log_lik_SOCWORK2_pois)
ic_waic_pois_SOCWORK <- ic_waic_SOCWORK1_pois$estimates[,1] + ic_waic_SOCWORK2_pois$estimates[,1]
ic_looic_pois_SOCWORK <- ic_looic_SOCWORK1_pois$estimates[,1] + ic_looic_SOCWORK2_pois$estimates[,1]
log_lik_COMWORK1_pois <- jagsModel_pois$BUGSoutput$sims.list$log_lik_COMWORK1
log_lik_COMWORK2_pois <- jagsModel_pois$BUGSoutput$sims.list$log_lik_COMWORK2
ic_waic_COMWORK1_pois <- waic(log_lik_COMWORK1_pois)
ic_waic_COMWORK2_pois <- waic(log_lik_COMWORK2_pois)
ic_looic_COMWORK1_pois <- loo(log_lik_COMWORK1_pois)
ic_looic_COMWORK2_pois <- loo(log_lik_COMWORK2_pois)
ic_waic_pois_COMWORK <- ic_waic_COMWORK1_pois$estimates[,1] + ic_waic_COMWORK2_pois$estimates[,1]
ic_looic_pois_COMWORK <- ic_looic_COMWORK1_pois$estimates[,1] + ic_looic_COMWORK2_pois$estimates[,1]
log_lik_GP1_pois <- jagsModel_pois$BUGSoutput$sims.list$log_lik_GP1
log_lik_GP2_pois <- jagsModel_pois$BUGSoutput$sims.list$log_lik_GP2
ic_waic_GP1_pois <- waic(log_lik_GP1_pois)
ic_waic_GP2_pois <- waic(log_lik_GP2_pois)
ic_looic_GP1_pois <- loo(log_lik_GP1_pois)
ic_looic_GP2_pois <- loo(log_lik_GP2_pois)
ic_waic_pois_GP <- ic_waic_GP1_pois$estimates[,1] + ic_waic_GP2_pois$estimates[,1]
ic_looic_pois_GP <- ic_looic_GP1_pois$estimates[,1] + ic_looic_GP2_pois$estimates[,1]
log_lik_NURSE1_pois <- jagsModel_pois$BUGSoutput$sims.list$log_lik_NURSE1
log_lik_NURSE2_pois <- jagsModel_pois$BUGSoutput$sims.list$log_lik_NURSE2
ic_waic_NURSE1_pois <- waic(log_lik_NURSE1_pois)
ic_waic_NURSE2_pois <- waic(log_lik_NURSE2_pois)
ic_looic_NURSE1_pois <- loo(log_lik_NURSE1_pois)
ic_looic_NURSE2_pois <- loo(log_lik_NURSE2_pois)
ic_waic_pois_NURSE <- ic_waic_NURSE1_pois$estimates[,1] + ic_waic_NURSE2_pois$estimates[,1]
ic_looic_pois_NURSE <- ic_looic_NURSE1_pois$estimates[,1] + ic_looic_NURSE2_pois$estimates[,1]
log_lik_THERAP1_pois <- jagsModel_pois$BUGSoutput$sims.list$log_lik_THERAP1
log_lik_THERAP2_pois <- jagsModel_pois$BUGSoutput$sims.list$log_lik_THERAP2
ic_waic_THERAP1_pois <- waic(log_lik_THERAP1_pois)
ic_waic_THERAP2_pois <- waic(log_lik_THERAP2_pois)
ic_looic_THERAP1_pois <- loo(log_lik_THERAP1_pois)
ic_looic_THERAP2_pois <- loo(log_lik_THERAP2_pois)
ic_waic_pois_THERAP <- ic_waic_THERAP1_pois$estimates[,1] + ic_waic_THERAP2_pois$estimates[,1]
ic_looic_pois_THERAP <- ic_looic_THERAP1_pois$estimates[,1] + ic_looic_THERAP2_pois$estimates[,1]

ic_waic_pois <- ic_waic_pois_PSYDR + ic_waic_pois_PSYCH + ic_waic_pois_PHYSI + 
  ic_waic_pois_DENT + ic_waic_pois_SOCWORK + ic_waic_pois_COMWORK + ic_waic_pois_GP +
  ic_waic_pois_NURSE + ic_waic_pois_THERAP
ic_looic_pois <- ic_looic_pois_PSYDR + ic_looic_pois_PSYCH + ic_looic_pois_PHYSI + 
  ic_looic_pois_DENT + ic_looic_pois_SOCWORK + ic_looic_pois_COMWORK + ic_looic_pois_GP +
  ic_looic_pois_NURSE + ic_looic_pois_THERAP

log_lik_PSYDR1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$log_lik_PSYDR1
log_lik_PSYDR2_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$log_lik_PSYDR2
ic_waic_PSYDR1_nbinom <- waic(log_lik_PSYDR1_nbinom)
ic_waic_PSYDR2_nbinom <- waic(log_lik_PSYDR2_nbinom)
ic_looic_PSYDR1_nbinom <- loo(log_lik_PSYDR1_nbinom)
ic_looic_PSYDR2_nbinom <- loo(log_lik_PSYDR2_nbinom)
ic_waic_nbinom_PSYDR <- ic_waic_PSYDR1_nbinom$estimates[,1] + ic_waic_PSYDR2_nbinom$estimates[,1]
ic_looic_nbinom_PSYDR <- ic_looic_PSYDR1_nbinom$estimates[,1] + ic_looic_PSYDR2_nbinom$estimates[,1]
log_lik_PSYCH1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$log_lik_PSYCH1
log_lik_PSYCH2_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$log_lik_PSYCH2
ic_waic_PSYCH1_nbinom <- waic(log_lik_PSYCH1_nbinom)
ic_waic_PSYCH2_nbinom <- waic(log_lik_PSYCH2_nbinom)
ic_looic_PSYCH1_nbinom <- loo(log_lik_PSYCH1_nbinom)
ic_looic_PSYCH2_nbinom <- loo(log_lik_PSYCH2_nbinom)
ic_waic_nbinom_PSYCH <- ic_waic_PSYCH1_nbinom$estimates[,1] + ic_waic_PSYCH2_nbinom$estimates[,1]
ic_looic_nbinom_PSYCH <- ic_looic_PSYCH1_nbinom$estimates[,1] + ic_looic_PSYCH2_nbinom$estimates[,1]
#log_lik_PHYSI1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$log_lik_PHYSI1
#log_lik_PHYSI2_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$log_lik_PHYSI2
#ic_waic_PHYSI1_nbinom <- waic(log_lik_PHYSI1_nbinom)
#ic_waic_PHYSI2_nbinom <- waic(log_lik_PHYSI2_nbinom)
#ic_looic_PHYSI1_nbinom <- loo(log_lik_PHYSI1_nbinom)
#ic_looic_PHYSI2_nbinom <- loo(log_lik_PHYSI2_nbinom)
#ic_waic_nbinom_PHYSI <- ic_waic_PHYSI1_nbinom$estimates[,1] + ic_waic_PHYSI2_nbinom$estimates[,1]
#ic_looic_nbinom_PHYSI <- ic_looic_PHYSI1_nbinom$estimates[,1] + ic_looic_PHYSI2_nbinom$estimates[,1]
log_lik_DENT1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$log_lik_DENT1
log_lik_DENT2_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$log_lik_DENT2
ic_waic_DENT1_nbinom <- waic(log_lik_DENT1_nbinom)
ic_waic_DENT2_nbinom <- waic(log_lik_DENT2_nbinom)
ic_looic_DENT1_nbinom <- loo(log_lik_DENT1_nbinom)
ic_looic_DENT2_nbinom <- loo(log_lik_DENT2_nbinom)
ic_waic_nbinom_DENT <- ic_waic_DENT1_nbinom$estimates[,1] + ic_waic_DENT2_nbinom$estimates[,1]
ic_looic_nbinom_DENT <- ic_looic_DENT1_nbinom$estimates[,1] + ic_looic_DENT2_nbinom$estimates[,1]
log_lik_SOCWORK1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$log_lik_SOCWORK1
log_lik_SOCWORK2_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$log_lik_SOCWORK2
ic_waic_SOCWORK1_nbinom <- waic(log_lik_SOCWORK1_nbinom)
ic_waic_SOCWORK2_nbinom <- waic(log_lik_SOCWORK2_nbinom)
ic_looic_SOCWORK1_nbinom <- loo(log_lik_SOCWORK1_nbinom)
ic_looic_SOCWORK2_nbinom <- loo(log_lik_SOCWORK2_nbinom)
ic_waic_nbinom_SOCWORK <- ic_waic_SOCWORK1_nbinom$estimates[,1] + ic_waic_SOCWORK2_nbinom$estimates[,1]
ic_looic_nbinom_SOCWORK <- ic_looic_SOCWORK1_nbinom$estimates[,1] + ic_looic_SOCWORK2_nbinom$estimates[,1]
#log_lik_COMWORK1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$log_lik_COMWORK1
#log_lik_COMWORK2_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$log_lik_COMWORK2
#ic_waic_COMWORK1_nbinom <- waic(log_lik_COMWORK1_nbinom)
#ic_waic_COMWORK2_nbinom <- waic(log_lik_COMWORK2_nbinom)
#ic_looic_COMWORK1_nbinom <- loo(log_lik_COMWORK1_nbinom)
#ic_looic_COMWORK2_nbinom <- loo(log_lik_COMWORK2_nbinom)
#ic_waic_nbinom_COMWORK <- ic_waic_COMWORK1_nbinom$estimates[,1] + ic_waic_COMWORK2_nbinom$estimates[,1]
#ic_looic_nbinom_COMWORK <- ic_looic_COMWORK1_nbinom$estimates[,1] + ic_looic_COMWORK2_nbinom$estimates[,1]
#log_lik_GP1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$log_lik_GP1
#log_lik_GP2_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$log_lik_GP2
#ic_waic_GP1_nbinom <- waic(log_lik_GP1_nbinom)
#ic_waic_GP2_nbinom <- waic(log_lik_GP2_nbinom)
#ic_looic_GP1_nbinom <- loo(log_lik_GP1_nbinom)
#ic_looic_GP2_nbinom <- loo(log_lik_GP2_nbinom)
#ic_waic_nbinom_GP <- ic_waic_GP1_nbinom$estimates[,1] + ic_waic_GP2_nbinom$estimates[,1]
#ic_looic_nbinom_GP <- ic_looic_GP1_nbinom$estimates[,1] + ic_looic_GP2_nbinom$estimates[,1]
log_lik_NURSE1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$log_lik_NURSE1
log_lik_NURSE2_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$log_lik_NURSE2
ic_waic_NURSE1_nbinom <- waic(log_lik_NURSE1_nbinom)
ic_waic_NURSE2_nbinom <- waic(log_lik_NURSE2_nbinom)
ic_looic_NURSE1_nbinom <- loo(log_lik_NURSE1_nbinom)
ic_looic_NURSE2_nbinom <- loo(log_lik_NURSE2_nbinom)
ic_waic_nbinom_NURSE <- ic_waic_NURSE1_nbinom$estimates[,1] + ic_waic_NURSE2_nbinom$estimates[,1]
ic_looic_nbinom_NURSE <- ic_looic_NURSE1_nbinom$estimates[,1] + ic_looic_NURSE2_nbinom$estimates[,1]
log_lik_THERAP1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$log_lik_THERAP1
log_lik_THERAP2_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$log_lik_THERAP2
ic_waic_THERAP1_nbinom <- waic(log_lik_THERAP1_nbinom)
ic_waic_THERAP2_nbinom <- waic(log_lik_THERAP2_nbinom)
ic_looic_THERAP1_nbinom <- loo(log_lik_THERAP1_nbinom)
ic_looic_THERAP2_nbinom <- loo(log_lik_THERAP2_nbinom)
ic_waic_nbinom_THERAP <- ic_waic_THERAP1_nbinom$estimates[,1] + ic_waic_THERAP2_nbinom$estimates[,1]
ic_looic_nbinom_THERAP <- ic_looic_THERAP1_nbinom$estimates[,1] + ic_looic_THERAP2_nbinom$estimates[,1]


#compare PPC between models using plots of replicated vs observed data (histograms, densities, ecdf)
library(bayesplot)
#generate replicated data for each model
PSYDR1_g0 <- HRU_PSYDR1[group==0]
PSYDR1_g1 <- HRU_PSYDR1[group==1]
PSYDR2_g0 <- HRU_PSYDR2[group==0]
PSYDR2_g1 <- HRU_PSYDR2[group==1]
PSYDR1_g0_obs <- PSYDR1_g0[complete.cases(PSYDR1_g0)]
PSYDR1_g1_obs <- PSYDR1_g1[complete.cases(PSYDR1_g1)]
PSYDR2_g0_obs <- PSYDR2_g0[complete.cases(PSYDR2_g0)]
PSYDR2_g1_obs <- PSYDR2_g1[complete.cases(PSYDR2_g1)]
mu_PSYDR1_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PSYDR1[,is.na(HRU_PSYDR1)==FALSE & group==0]
mu_PSYDR1_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PSYDR1[,is.na(HRU_PSYDR1)==FALSE & group==1]
mu_PSYDR2_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PSYDR2[,is.na(HRU_PSYDR2)==FALSE & group==0]
mu_PSYDR2_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PSYDR2[,is.na(HRU_PSYDR2)==FALSE & group==1]
sd_PSYDR1_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PSYDR1[,1,1]
sd_PSYDR1_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PSYDR1[,2,1]
sd_PSYDR2_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PSYDR2[,1,1]
sd_PSYDR2_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PSYDR2[,2,1]
PSYDR1_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_PSYDR1_obs_g0_norm)[2])
PSYDR1_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_PSYDR1_obs_g1_norm)[2])
PSYDR2_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_PSYDR2_obs_g0_norm)[2])
PSYDR2_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_PSYDR2_obs_g1_norm)[2])
set.seed(8361299)
for(i in 1:jagsModel_norm$n.iter){
    PSYDR1_obs_g0_rep_norm[i,] <- rnorm(dim(mu_PSYDR1_obs_g0_norm)[2], mu_PSYDR1_obs_g0_norm[i,], sd_PSYDR1_obs_g0_norm[i])
    PSYDR1_obs_g1_rep_norm[i,] <- rnorm(dim(mu_PSYDR1_obs_g1_norm)[2], mu_PSYDR1_obs_g1_norm[i,], sd_PSYDR1_obs_g1_norm[i])
    PSYDR2_obs_g0_rep_norm[i,] <- rnorm(dim(mu_PSYDR2_obs_g0_norm)[2], mu_PSYDR2_obs_g0_norm[i,], sd_PSYDR2_obs_g0_norm[i])
    PSYDR2_obs_g1_rep_norm[i,] <- rnorm(dim(mu_PSYDR2_obs_g1_norm)[2], mu_PSYDR2_obs_g1_norm[i,], sd_PSYDR2_obs_g1_norm[i])
}
PSYCH1_g0 <- HRU_PSYCH1[group==0]
PSYCH1_g1 <- HRU_PSYCH1[group==1]
PSYCH2_g0 <- HRU_PSYCH2[group==0]
PSYCH2_g1 <- HRU_PSYCH2[group==1]
PSYCH1_g0_obs <- PSYCH1_g0[complete.cases(PSYCH1_g0)]
PSYCH1_g1_obs <- PSYCH1_g1[complete.cases(PSYCH1_g1)]
PSYCH2_g0_obs <- PSYCH2_g0[complete.cases(PSYCH2_g0)]
PSYCH2_g1_obs <- PSYCH2_g1[complete.cases(PSYCH2_g1)]
mu_PSYCH1_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PSYCH1[,is.na(HRU_PSYCH1)==FALSE & group==0]
mu_PSYCH1_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PSYCH1[,is.na(HRU_PSYCH1)==FALSE & group==1]
mu_PSYCH2_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PSYCH2[,is.na(HRU_PSYCH2)==FALSE & group==0]
mu_PSYCH2_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PSYCH2[,is.na(HRU_PSYCH2)==FALSE & group==1]
sd_PSYCH1_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PSYCH1[,1,1]
sd_PSYCH1_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PSYCH1[,2,1]
sd_PSYCH2_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PSYCH2[,1,1]
sd_PSYCH2_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PSYCH2[,2,1]
PSYCH1_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_PSYCH1_obs_g0_norm)[2])
PSYCH1_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_PSYCH1_obs_g1_norm)[2])
PSYCH2_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_PSYCH2_obs_g0_norm)[2])
PSYCH2_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_PSYCH2_obs_g1_norm)[2])
set.seed(8361299)
for(i in 1:jagsModel_norm$n.iter){
  PSYCH1_obs_g0_rep_norm[i,] <- rnorm(dim(mu_PSYCH1_obs_g0_norm)[2], mu_PSYCH1_obs_g0_norm[i,], sd_PSYCH1_obs_g0_norm[i])
  PSYCH1_obs_g1_rep_norm[i,] <- rnorm(dim(mu_PSYCH1_obs_g1_norm)[2], mu_PSYCH1_obs_g1_norm[i,], sd_PSYCH1_obs_g1_norm[i])
  PSYCH2_obs_g0_rep_norm[i,] <- rnorm(dim(mu_PSYCH2_obs_g0_norm)[2], mu_PSYCH2_obs_g0_norm[i,], sd_PSYCH2_obs_g0_norm[i])
  PSYCH2_obs_g1_rep_norm[i,] <- rnorm(dim(mu_PSYCH2_obs_g1_norm)[2], mu_PSYCH2_obs_g1_norm[i,], sd_PSYCH2_obs_g1_norm[i])
}
PHYSI1_g0 <- HRU_PHYSI1[group==0]
PHYSI1_g1 <- HRU_PHYSI1[group==1]
PHYSI2_g0 <- HRU_PHYSI2[group==0]
PHYSI2_g1 <- HRU_PHYSI2[group==1]
PHYSI1_g0_obs <- PHYSI1_g0[complete.cases(PHYSI1_g0)]
PHYSI1_g1_obs <- PHYSI1_g1[complete.cases(PHYSI1_g1)]
PHYSI2_g0_obs <- PHYSI2_g0[complete.cases(PHYSI2_g0)]
PHYSI2_g1_obs <- PHYSI2_g1[complete.cases(PHYSI2_g1)]
mu_PHYSI1_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PHYSI1[,is.na(HRU_PHYSI1)==FALSE & group==0]
mu_PHYSI1_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PHYSI1[,is.na(HRU_PHYSI1)==FALSE & group==1]
mu_PHYSI2_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PHYSI2[,is.na(HRU_PHYSI2)==FALSE & group==0]
mu_PHYSI2_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PHYSI2[,is.na(HRU_PHYSI2)==FALSE & group==1]
sd_PHYSI1_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PHYSI1[,1,1]
sd_PHYSI1_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PHYSI1[,2,1]
sd_PHYSI2_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PHYSI2[,1,1]
sd_PHYSI2_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PHYSI2[,2,1]
PHYSI1_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_PHYSI1_obs_g0_norm)[2])
PHYSI1_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_PHYSI1_obs_g1_norm)[2])
PHYSI2_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_PHYSI2_obs_g0_norm)[2])
PHYSI2_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_PHYSI2_obs_g1_norm)[2])
set.seed(8361299)
for(i in 1:jagsModel_norm$n.iter){
  PHYSI1_obs_g0_rep_norm[i,] <- rnorm(dim(mu_PHYSI1_obs_g0_norm)[2], mu_PHYSI1_obs_g0_norm[i,], sd_PHYSI1_obs_g0_norm[i])
  PHYSI1_obs_g1_rep_norm[i,] <- rnorm(dim(mu_PHYSI1_obs_g1_norm)[2], mu_PHYSI1_obs_g1_norm[i,], sd_PHYSI1_obs_g1_norm[i])
  PHYSI2_obs_g0_rep_norm[i,] <- rnorm(dim(mu_PHYSI2_obs_g0_norm)[2], mu_PHYSI2_obs_g0_norm[i,], sd_PHYSI2_obs_g0_norm[i])
  PHYSI2_obs_g1_rep_norm[i,] <- rnorm(dim(mu_PHYSI2_obs_g1_norm)[2], mu_PHYSI2_obs_g1_norm[i,], sd_PHYSI2_obs_g1_norm[i])
}
DENT1_g0 <- HRU_DENT1[group==0]
DENT1_g1 <- HRU_DENT1[group==1]
DENT2_g0 <- HRU_DENT2[group==0]
DENT2_g1 <- HRU_DENT2[group==1]
DENT1_g0_obs <- DENT1_g0[complete.cases(DENT1_g0)]
DENT1_g1_obs <- DENT1_g1[complete.cases(DENT1_g1)]
DENT2_g0_obs <- DENT2_g0[complete.cases(DENT2_g0)]
DENT2_g1_obs <- DENT2_g1[complete.cases(DENT2_g1)]
mu_DENT1_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_DENT1[,is.na(HRU_DENT1)==FALSE & group==0]
mu_DENT1_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_DENT1[,is.na(HRU_DENT1)==FALSE & group==1]
mu_DENT2_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_DENT2[,is.na(HRU_DENT2)==FALSE & group==0]
mu_DENT2_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_DENT2[,is.na(HRU_DENT2)==FALSE & group==1]
sd_DENT1_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_DENT1[,1,1]
sd_DENT1_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_DENT1[,2,1]
sd_DENT2_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_DENT2[,1,1]
sd_DENT2_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_DENT2[,2,1]
DENT1_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_DENT1_obs_g0_norm)[2])
DENT1_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_DENT1_obs_g1_norm)[2])
DENT2_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_DENT2_obs_g0_norm)[2])
DENT2_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_DENT2_obs_g1_norm)[2])
set.seed(8361299)
for(i in 1:jagsModel_norm$n.iter){
  DENT1_obs_g0_rep_norm[i,] <- rnorm(dim(mu_DENT1_obs_g0_norm)[2], mu_DENT1_obs_g0_norm[i,], sd_DENT1_obs_g0_norm[i])
  DENT1_obs_g1_rep_norm[i,] <- rnorm(dim(mu_DENT1_obs_g1_norm)[2], mu_DENT1_obs_g1_norm[i,], sd_DENT1_obs_g1_norm[i])
  DENT2_obs_g0_rep_norm[i,] <- rnorm(dim(mu_DENT2_obs_g0_norm)[2], mu_DENT2_obs_g0_norm[i,], sd_DENT2_obs_g0_norm[i])
  DENT2_obs_g1_rep_norm[i,] <- rnorm(dim(mu_DENT2_obs_g1_norm)[2], mu_DENT2_obs_g1_norm[i,], sd_DENT2_obs_g1_norm[i])
}
SOCWORK1_g0 <- HRU_SOCWORK1[group==0]
SOCWORK1_g1 <- HRU_SOCWORK1[group==1]
SOCWORK2_g0 <- HRU_SOCWORK2[group==0]
SOCWORK2_g1 <- HRU_SOCWORK2[group==1]
SOCWORK1_g0_obs <- SOCWORK1_g0[complete.cases(SOCWORK1_g0)]
SOCWORK1_g1_obs <- SOCWORK1_g1[complete.cases(SOCWORK1_g1)]
SOCWORK2_g0_obs <- SOCWORK2_g0[complete.cases(SOCWORK2_g0)]
SOCWORK2_g1_obs <- SOCWORK2_g1[complete.cases(SOCWORK2_g1)]
mu_SOCWORK1_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_SOCWORK1[,is.na(HRU_SOCWORK1)==FALSE & group==0]
mu_SOCWORK1_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_SOCWORK1[,is.na(HRU_SOCWORK1)==FALSE & group==1]
mu_SOCWORK2_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_SOCWORK2[,is.na(HRU_SOCWORK2)==FALSE & group==0]
mu_SOCWORK2_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_SOCWORK2[,is.na(HRU_SOCWORK2)==FALSE & group==1]
sd_SOCWORK1_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_SOCWORK1[,1,1]
sd_SOCWORK1_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_SOCWORK1[,2,1]
sd_SOCWORK2_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_SOCWORK2[,1,1]
sd_SOCWORK2_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_SOCWORK2[,2,1]
SOCWORK1_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_SOCWORK1_obs_g0_norm)[2])
SOCWORK1_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_SOCWORK1_obs_g1_norm)[2])
SOCWORK2_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_SOCWORK2_obs_g0_norm)[2])
SOCWORK2_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_SOCWORK2_obs_g1_norm)[2])
set.seed(8361299)
for(i in 1:jagsModel_norm$n.iter){
  SOCWORK1_obs_g0_rep_norm[i,] <- rnorm(dim(mu_SOCWORK1_obs_g0_norm)[2], mu_SOCWORK1_obs_g0_norm[i,], sd_SOCWORK1_obs_g0_norm[i])
  SOCWORK1_obs_g1_rep_norm[i,] <- rnorm(dim(mu_SOCWORK1_obs_g1_norm)[2], mu_SOCWORK1_obs_g1_norm[i,], sd_SOCWORK1_obs_g1_norm[i])
  SOCWORK2_obs_g0_rep_norm[i,] <- rnorm(dim(mu_SOCWORK2_obs_g0_norm)[2], mu_SOCWORK2_obs_g0_norm[i,], sd_SOCWORK2_obs_g0_norm[i])
  SOCWORK2_obs_g1_rep_norm[i,] <- rnorm(dim(mu_SOCWORK2_obs_g1_norm)[2], mu_SOCWORK2_obs_g1_norm[i,], sd_SOCWORK2_obs_g1_norm[i])
}
COMWORK1_g0 <- HRU_COMWORK1[group==0]
COMWORK1_g1 <- HRU_COMWORK1[group==1]
COMWORK2_g0 <- HRU_COMWORK2[group==0]
COMWORK2_g1 <- HRU_COMWORK2[group==1]
COMWORK1_g0_obs <- COMWORK1_g0[complete.cases(COMWORK1_g0)]
COMWORK1_g1_obs <- COMWORK1_g1[complete.cases(COMWORK1_g1)]
COMWORK2_g0_obs <- COMWORK2_g0[complete.cases(COMWORK2_g0)]
COMWORK2_g1_obs <- COMWORK2_g1[complete.cases(COMWORK2_g1)]
mu_COMWORK1_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_COMWORK1[,is.na(HRU_COMWORK1)==FALSE & group==0]
mu_COMWORK1_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_COMWORK1[,is.na(HRU_COMWORK1)==FALSE & group==1]
mu_COMWORK2_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_COMWORK2[,is.na(HRU_COMWORK2)==FALSE & group==0]
mu_COMWORK2_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_COMWORK2[,is.na(HRU_COMWORK2)==FALSE & group==1]
sd_COMWORK1_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_COMWORK1[,1,1]
sd_COMWORK1_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_COMWORK1[,2,1]
sd_COMWORK2_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_COMWORK2[,1,1]
sd_COMWORK2_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_COMWORK2[,2,1]
COMWORK1_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_COMWORK1_obs_g0_norm)[2])
COMWORK1_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_COMWORK1_obs_g1_norm)[2])
COMWORK2_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_COMWORK2_obs_g0_norm)[2])
COMWORK2_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_COMWORK2_obs_g1_norm)[2])
set.seed(8361299)
for(i in 1:jagsModel_norm$n.iter){
  COMWORK1_obs_g0_rep_norm[i,] <- rnorm(dim(mu_COMWORK1_obs_g0_norm)[2], mu_COMWORK1_obs_g0_norm[i,], sd_COMWORK1_obs_g0_norm[i])
  COMWORK1_obs_g1_rep_norm[i,] <- rnorm(dim(mu_COMWORK1_obs_g1_norm)[2], mu_COMWORK1_obs_g1_norm[i,], sd_COMWORK1_obs_g1_norm[i])
  COMWORK2_obs_g0_rep_norm[i,] <- rnorm(dim(mu_COMWORK2_obs_g0_norm)[2], mu_COMWORK2_obs_g0_norm[i,], sd_COMWORK2_obs_g0_norm[i])
  COMWORK2_obs_g1_rep_norm[i,] <- rnorm(dim(mu_COMWORK2_obs_g1_norm)[2], mu_COMWORK2_obs_g1_norm[i,], sd_COMWORK2_obs_g1_norm[i])
}
GP1_g0 <- HRU_GP1[group==0]
GP1_g1 <- HRU_GP1[group==1]
GP2_g0 <- HRU_GP2[group==0]
GP2_g1 <- HRU_GP2[group==1]
GP1_g0_obs <- GP1_g0[complete.cases(GP1_g0)]
GP1_g1_obs <- GP1_g1[complete.cases(GP1_g1)]
GP2_g0_obs <- GP2_g0[complete.cases(GP2_g0)]
GP2_g1_obs <- GP2_g1[complete.cases(GP2_g1)]
mu_GP1_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_GP1[,is.na(HRU_GP1)==FALSE & group==0]
mu_GP1_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_GP1[,is.na(HRU_GP1)==FALSE & group==1]
mu_GP2_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_GP2[,is.na(HRU_GP2)==FALSE & group==0]
mu_GP2_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_GP2[,is.na(HRU_GP2)==FALSE & group==1]
sd_GP1_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_GP1[,1]
sd_GP1_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_GP1[,2]
sd_GP2_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_GP2[,1]
sd_GP2_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_GP2[,2]
GP1_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_GP1_obs_g0_norm)[2])
GP1_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_GP1_obs_g1_norm)[2])
GP2_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_GP2_obs_g0_norm)[2])
GP2_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_GP2_obs_g1_norm)[2])
set.seed(8361299)
for(i in 1:jagsModel_norm$n.iter){
  GP1_obs_g0_rep_norm[i,] <- rnorm(dim(mu_GP1_obs_g0_norm)[2], mu_GP1_obs_g0_norm[i,], sd_GP1_obs_g0_norm[i])
  GP1_obs_g1_rep_norm[i,] <- rnorm(dim(mu_GP1_obs_g1_norm)[2], mu_GP1_obs_g1_norm[i,], sd_GP1_obs_g1_norm[i])
  GP2_obs_g0_rep_norm[i,] <- rnorm(dim(mu_GP2_obs_g0_norm)[2], mu_GP2_obs_g0_norm[i,], sd_GP2_obs_g0_norm[i])
  GP2_obs_g1_rep_norm[i,] <- rnorm(dim(mu_GP2_obs_g1_norm)[2], mu_GP2_obs_g1_norm[i,], sd_GP2_obs_g1_norm[i])
}
NURSE1_g0 <- HRU_NURSE1[group==0]
NURSE1_g1 <- HRU_NURSE1[group==1]
NURSE2_g0 <- HRU_NURSE2[group==0]
NURSE2_g1 <- HRU_NURSE2[group==1]
NURSE1_g0_obs <- NURSE1_g0[complete.cases(NURSE1_g0)]
NURSE1_g1_obs <- NURSE1_g1[complete.cases(NURSE1_g1)]
NURSE2_g0_obs <- NURSE2_g0[complete.cases(NURSE2_g0)]
NURSE2_g1_obs <- NURSE2_g1[complete.cases(NURSE2_g1)]
mu_NURSE1_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_NURSE1[,is.na(HRU_NURSE1)==FALSE & group==0]
mu_NURSE1_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_NURSE1[,is.na(HRU_NURSE1)==FALSE & group==1]
mu_NURSE2_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_NURSE2[,is.na(HRU_NURSE2)==FALSE & group==0]
mu_NURSE2_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_NURSE2[,is.na(HRU_NURSE2)==FALSE & group==1]
sd_NURSE1_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_NURSE1[,1,1]
sd_NURSE1_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_NURSE1[,2,1]
sd_NURSE2_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_NURSE2[,1,1]
sd_NURSE2_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_NURSE2[,2,1]
NURSE1_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_NURSE1_obs_g0_norm)[2])
NURSE1_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_NURSE1_obs_g1_norm)[2])
NURSE2_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_NURSE2_obs_g0_norm)[2])
NURSE2_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_NURSE2_obs_g1_norm)[2])
set.seed(8361299)
for(i in 1:jagsModel_norm$n.iter){
  NURSE1_obs_g0_rep_norm[i,] <- rnorm(dim(mu_NURSE1_obs_g0_norm)[2], mu_NURSE1_obs_g0_norm[i,], sd_NURSE1_obs_g0_norm[i])
  NURSE1_obs_g1_rep_norm[i,] <- rnorm(dim(mu_NURSE1_obs_g1_norm)[2], mu_NURSE1_obs_g1_norm[i,], sd_NURSE1_obs_g1_norm[i])
  NURSE2_obs_g0_rep_norm[i,] <- rnorm(dim(mu_NURSE2_obs_g0_norm)[2], mu_NURSE2_obs_g0_norm[i,], sd_NURSE2_obs_g0_norm[i])
  NURSE2_obs_g1_rep_norm[i,] <- rnorm(dim(mu_NURSE2_obs_g1_norm)[2], mu_NURSE2_obs_g1_norm[i,], sd_NURSE2_obs_g1_norm[i])
}
THERAP1_g0 <- HRU_THERAP1[group==0]
THERAP1_g1 <- HRU_THERAP1[group==1]
THERAP2_g0 <- HRU_THERAP2[group==0]
THERAP2_g1 <- HRU_THERAP2[group==1]
THERAP1_g0_obs <- THERAP1_g0[complete.cases(THERAP1_g0)]
THERAP1_g1_obs <- THERAP1_g1[complete.cases(THERAP1_g1)]
THERAP2_g0_obs <- THERAP2_g0[complete.cases(THERAP2_g0)]
THERAP2_g1_obs <- THERAP2_g1[complete.cases(THERAP2_g1)]
mu_THERAP1_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_THERAP1[,is.na(HRU_THERAP1)==FALSE & group==0]
mu_THERAP1_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_THERAP1[,is.na(HRU_THERAP1)==FALSE & group==1]
mu_THERAP2_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_THERAP2[,is.na(HRU_THERAP2)==FALSE & group==0]
mu_THERAP2_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_THERAP2[,is.na(HRU_THERAP2)==FALSE & group==1]
sd_THERAP1_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_THERAP1[,1,1]
sd_THERAP1_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_THERAP1[,2,1]
sd_THERAP2_obs_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_THERAP2[,1,1]
sd_THERAP2_obs_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_THERAP2[,2,1]
THERAP1_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_THERAP1_obs_g0_norm)[2])
THERAP1_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_THERAP1_obs_g1_norm)[2])
THERAP2_obs_g0_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_THERAP2_obs_g0_norm)[2])
THERAP2_obs_g1_rep_norm <- matrix(NA, nrow = jagsModel_norm$n.iter, ncol = dim(mu_THERAP2_obs_g1_norm)[2])
set.seed(8361299)
for(i in 1:jagsModel_norm$n.iter){
  THERAP1_obs_g0_rep_norm[i,] <- rnorm(dim(mu_THERAP1_obs_g0_norm)[2], mu_THERAP1_obs_g0_norm[i,], sd_THERAP1_obs_g0_norm[i])
  THERAP1_obs_g1_rep_norm[i,] <- rnorm(dim(mu_THERAP1_obs_g1_norm)[2], mu_THERAP1_obs_g1_norm[i,], sd_THERAP1_obs_g1_norm[i])
  THERAP2_obs_g0_rep_norm[i,] <- rnorm(dim(mu_THERAP2_obs_g0_norm)[2], mu_THERAP2_obs_g0_norm[i,], sd_THERAP2_obs_g0_norm[i])
  THERAP2_obs_g1_rep_norm[i,] <- rnorm(dim(mu_THERAP2_obs_g1_norm)[2], mu_THERAP2_obs_g1_norm[i,], sd_THERAP2_obs_g1_norm[i])
}


mu_PSYDR1_obs_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PSYDR1[,is.na(HRU_PSYDR1)==FALSE & group==0]
mu_PSYDR1_obs_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PSYDR1[,is.na(HRU_PSYDR1)==FALSE & group==1]
mu_PSYDR2_obs_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PSYDR2[,is.na(HRU_PSYDR2)==FALSE & group==0]
mu_PSYDR2_obs_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PSYDR2[,is.na(HRU_PSYDR2)==FALSE & group==1]
PSYDR1_obs_g0_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_PSYDR1_obs_g0_pois)[2])
PSYDR1_obs_g1_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_PSYDR1_obs_g1_pois)[2])
PSYDR2_obs_g0_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_PSYDR2_obs_g0_pois)[2])
PSYDR2_obs_g1_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_PSYDR2_obs_g1_pois)[2])
set.seed(8361299)
for(i in 1:jagsModel_pois$n.iter){
  PSYDR1_obs_g0_rep_pois[i,] <- rpois(dim(mu_PSYDR1_obs_g0_pois)[2], mu_PSYDR1_obs_g0_pois[i,])
  PSYDR1_obs_g1_rep_pois[i,] <- rpois(dim(mu_PSYDR1_obs_g1_pois)[2], mu_PSYDR1_obs_g1_pois[i,])
  PSYDR2_obs_g0_rep_pois[i,] <- rpois(dim(mu_PSYDR2_obs_g0_pois)[2], mu_PSYDR2_obs_g0_pois[i,])
  PSYDR2_obs_g1_rep_pois[i,] <- rpois(dim(mu_PSYDR2_obs_g1_pois)[2], mu_PSYDR2_obs_g1_pois[i,])
}
mu_PSYCH1_obs_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PSYCH1[,is.na(HRU_PSYCH1)==FALSE & group==0]
mu_PSYCH1_obs_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PSYCH1[,is.na(HRU_PSYCH1)==FALSE & group==1]
mu_PSYCH2_obs_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PSYCH2[,is.na(HRU_PSYCH2)==FALSE & group==0]
mu_PSYCH2_obs_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PSYCH2[,is.na(HRU_PSYCH2)==FALSE & group==1]
PSYCH1_obs_g0_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_PSYCH1_obs_g0_pois)[2])
PSYCH1_obs_g1_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_PSYCH1_obs_g1_pois)[2])
PSYCH2_obs_g0_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_PSYCH2_obs_g0_pois)[2])
PSYCH2_obs_g1_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_PSYCH2_obs_g1_pois)[2])
set.seed(8361299)
for(i in 1:jagsModel_pois$n.iter){
  PSYCH1_obs_g0_rep_pois[i,] <- rpois(dim(mu_PSYCH1_obs_g0_pois)[2], mu_PSYCH1_obs_g0_pois[i,])
  PSYCH1_obs_g1_rep_pois[i,] <- rpois(dim(mu_PSYCH1_obs_g1_pois)[2], mu_PSYCH1_obs_g1_pois[i,])
  PSYCH2_obs_g0_rep_pois[i,] <- rpois(dim(mu_PSYCH2_obs_g0_pois)[2], mu_PSYCH2_obs_g0_pois[i,])
  PSYCH2_obs_g1_rep_pois[i,] <- rpois(dim(mu_PSYCH2_obs_g1_pois)[2], mu_PSYCH2_obs_g1_pois[i,])
}
mu_PHYSI1_obs_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PHYSI1[,is.na(HRU_PHYSI1)==FALSE & group==0]
mu_PHYSI1_obs_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PHYSI1[,is.na(HRU_PHYSI1)==FALSE & group==1]
mu_PHYSI2_obs_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PHYSI2[,is.na(HRU_PHYSI2)==FALSE & group==0]
mu_PHYSI2_obs_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PHYSI2[,is.na(HRU_PHYSI2)==FALSE & group==1]
PHYSI1_obs_g0_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_PHYSI1_obs_g0_pois)[2])
PHYSI1_obs_g1_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_PHYSI1_obs_g1_pois)[2])
PHYSI2_obs_g0_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_PHYSI2_obs_g0_pois)[2])
PHYSI2_obs_g1_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_PHYSI2_obs_g1_pois)[2])
set.seed(8361299)
for(i in 1:jagsModel_pois$n.iter){
  PHYSI1_obs_g0_rep_pois[i,] <- rpois(dim(mu_PHYSI1_obs_g0_pois)[2], mu_PHYSI1_obs_g0_pois[i,])
  PHYSI1_obs_g1_rep_pois[i,] <- rpois(dim(mu_PHYSI1_obs_g1_pois)[2], mu_PHYSI1_obs_g1_pois[i,])
  PHYSI2_obs_g0_rep_pois[i,] <- rpois(dim(mu_PHYSI2_obs_g0_pois)[2], mu_PHYSI2_obs_g0_pois[i,])
  PHYSI2_obs_g1_rep_pois[i,] <- rpois(dim(mu_PHYSI2_obs_g1_pois)[2], mu_PHYSI2_obs_g1_pois[i,])
}
mu_DENT1_obs_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_DENT1[,is.na(HRU_DENT1)==FALSE & group==0]
mu_DENT1_obs_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_DENT1[,is.na(HRU_DENT1)==FALSE & group==1]
mu_DENT2_obs_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_DENT2[,is.na(HRU_DENT2)==FALSE & group==0]
mu_DENT2_obs_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_DENT2[,is.na(HRU_DENT2)==FALSE & group==1]
DENT1_obs_g0_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_DENT1_obs_g0_pois)[2])
DENT1_obs_g1_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_DENT1_obs_g1_pois)[2])
DENT2_obs_g0_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_DENT2_obs_g0_pois)[2])
DENT2_obs_g1_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_DENT2_obs_g1_pois)[2])
set.seed(8361299)
for(i in 1:jagsModel_pois$n.iter){
  DENT1_obs_g0_rep_pois[i,] <- rpois(dim(mu_DENT1_obs_g0_pois)[2], mu_DENT1_obs_g0_pois[i,])
  DENT1_obs_g1_rep_pois[i,] <- rpois(dim(mu_DENT1_obs_g1_pois)[2], mu_DENT1_obs_g1_pois[i,])
  DENT2_obs_g0_rep_pois[i,] <- rpois(dim(mu_DENT2_obs_g0_pois)[2], mu_DENT2_obs_g0_pois[i,])
  DENT2_obs_g1_rep_pois[i,] <- rpois(dim(mu_DENT2_obs_g1_pois)[2], mu_DENT2_obs_g1_pois[i,])
}
mu_SOCWORK1_obs_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_SOCWORK1[,is.na(HRU_SOCWORK1)==FALSE & group==0]
mu_SOCWORK1_obs_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_SOCWORK1[,is.na(HRU_SOCWORK1)==FALSE & group==1]
mu_SOCWORK2_obs_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_SOCWORK2[,is.na(HRU_SOCWORK2)==FALSE & group==0]
mu_SOCWORK2_obs_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_SOCWORK2[,is.na(HRU_SOCWORK2)==FALSE & group==1]
SOCWORK1_obs_g0_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_SOCWORK1_obs_g0_pois)[2])
SOCWORK1_obs_g1_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_SOCWORK1_obs_g1_pois)[2])
SOCWORK2_obs_g0_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_SOCWORK2_obs_g0_pois)[2])
SOCWORK2_obs_g1_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_SOCWORK2_obs_g1_pois)[2])
set.seed(8361299)
for(i in 1:jagsModel_pois$n.iter){
  SOCWORK1_obs_g0_rep_pois[i,] <- rpois(dim(mu_SOCWORK1_obs_g0_pois)[2], mu_SOCWORK1_obs_g0_pois[i,])
  SOCWORK1_obs_g1_rep_pois[i,] <- rpois(dim(mu_SOCWORK1_obs_g1_pois)[2], mu_SOCWORK1_obs_g1_pois[i,])
  SOCWORK2_obs_g0_rep_pois[i,] <- rpois(dim(mu_SOCWORK2_obs_g0_pois)[2], mu_SOCWORK2_obs_g0_pois[i,])
  SOCWORK2_obs_g1_rep_pois[i,] <- rpois(dim(mu_SOCWORK2_obs_g1_pois)[2], mu_SOCWORK2_obs_g1_pois[i,])
}
mu_COMWORK1_obs_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_COMWORK1[,is.na(HRU_COMWORK1)==FALSE & group==0]
mu_COMWORK1_obs_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_COMWORK1[,is.na(HRU_COMWORK1)==FALSE & group==1]
mu_COMWORK2_obs_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_COMWORK2[,is.na(HRU_COMWORK2)==FALSE & group==0]
mu_COMWORK2_obs_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_COMWORK2[,is.na(HRU_COMWORK2)==FALSE & group==1]
COMWORK1_obs_g0_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_COMWORK1_obs_g0_pois)[2])
COMWORK1_obs_g1_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_COMWORK1_obs_g1_pois)[2])
COMWORK2_obs_g0_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_COMWORK2_obs_g0_pois)[2])
COMWORK2_obs_g1_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_COMWORK2_obs_g1_pois)[2])
set.seed(8361299)
for(i in 1:jagsModel_pois$n.iter){
  COMWORK1_obs_g0_rep_pois[i,] <- rpois(dim(mu_COMWORK1_obs_g0_pois)[2], mu_COMWORK1_obs_g0_pois[i,])
  COMWORK1_obs_g1_rep_pois[i,] <- rpois(dim(mu_COMWORK1_obs_g1_pois)[2], mu_COMWORK1_obs_g1_pois[i,])
  COMWORK2_obs_g0_rep_pois[i,] <- rpois(dim(mu_COMWORK2_obs_g0_pois)[2], mu_COMWORK2_obs_g0_pois[i,])
  COMWORK2_obs_g1_rep_pois[i,] <- rpois(dim(mu_COMWORK2_obs_g1_pois)[2], mu_COMWORK2_obs_g1_pois[i,])
}
mu_GP1_obs_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_GP1[,is.na(HRU_GP1)==FALSE & group==0]
mu_GP1_obs_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_GP1[,is.na(HRU_GP1)==FALSE & group==1]
mu_GP2_obs_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_GP2[,is.na(HRU_GP2)==FALSE & group==0]
mu_GP2_obs_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_GP2[,is.na(HRU_GP2)==FALSE & group==1]
GP1_obs_g0_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_GP1_obs_g0_pois)[2])
GP1_obs_g1_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_GP1_obs_g1_pois)[2])
GP2_obs_g0_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_GP2_obs_g0_pois)[2])
GP2_obs_g1_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_GP2_obs_g1_pois)[2])
set.seed(8361299)
for(i in 1:jagsModel_pois$n.iter){
  GP1_obs_g0_rep_pois[i,] <- rpois(dim(mu_GP1_obs_g0_pois)[2], mu_GP1_obs_g0_pois[i,])
  GP1_obs_g1_rep_pois[i,] <- rpois(dim(mu_GP1_obs_g1_pois)[2], mu_GP1_obs_g1_pois[i,])
  GP2_obs_g0_rep_pois[i,] <- rpois(dim(mu_GP2_obs_g0_pois)[2], mu_GP2_obs_g0_pois[i,])
  GP2_obs_g1_rep_pois[i,] <- rpois(dim(mu_GP2_obs_g1_pois)[2], mu_GP2_obs_g1_pois[i,])
}
mu_NURSE1_obs_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_NURSE1[,is.na(HRU_NURSE1)==FALSE & group==0]
mu_NURSE1_obs_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_NURSE1[,is.na(HRU_NURSE1)==FALSE & group==1]
mu_NURSE2_obs_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_NURSE2[,is.na(HRU_NURSE2)==FALSE & group==0]
mu_NURSE2_obs_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_NURSE2[,is.na(HRU_NURSE2)==FALSE & group==1]
NURSE1_obs_g0_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_NURSE1_obs_g0_pois)[2])
NURSE1_obs_g1_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_NURSE1_obs_g1_pois)[2])
NURSE2_obs_g0_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_NURSE2_obs_g0_pois)[2])
NURSE2_obs_g1_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_NURSE2_obs_g1_pois)[2])
set.seed(8361299)
for(i in 1:jagsModel_pois$n.iter){
  NURSE1_obs_g0_rep_pois[i,] <- rpois(dim(mu_NURSE1_obs_g0_pois)[2], mu_NURSE1_obs_g0_pois[i,])
  NURSE1_obs_g1_rep_pois[i,] <- rpois(dim(mu_NURSE1_obs_g1_pois)[2], mu_NURSE1_obs_g1_pois[i,])
  NURSE2_obs_g0_rep_pois[i,] <- rpois(dim(mu_NURSE2_obs_g0_pois)[2], mu_NURSE2_obs_g0_pois[i,])
  NURSE2_obs_g1_rep_pois[i,] <- rpois(dim(mu_NURSE2_obs_g1_pois)[2], mu_NURSE2_obs_g1_pois[i,])
}
mu_THERAP1_obs_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_THERAP1[,is.na(HRU_THERAP1)==FALSE & group==0]
mu_THERAP1_obs_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_THERAP1[,is.na(HRU_THERAP1)==FALSE & group==1]
mu_THERAP2_obs_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_THERAP2[,is.na(HRU_THERAP2)==FALSE & group==0]
mu_THERAP2_obs_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_THERAP2[,is.na(HRU_THERAP2)==FALSE & group==1]
THERAP1_obs_g0_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_THERAP1_obs_g0_pois)[2])
THERAP1_obs_g1_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_THERAP1_obs_g1_pois)[2])
THERAP2_obs_g0_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_THERAP2_obs_g0_pois)[2])
THERAP2_obs_g1_rep_pois <- matrix(NA, nrow = jagsModel_pois$n.iter, ncol = dim(mu_THERAP2_obs_g1_pois)[2])
set.seed(8361299)
for(i in 1:jagsModel_pois$n.iter){
  THERAP1_obs_g0_rep_pois[i,] <- rpois(dim(mu_THERAP1_obs_g0_pois)[2], mu_THERAP1_obs_g0_pois[i,])
  THERAP1_obs_g1_rep_pois[i,] <- rpois(dim(mu_THERAP1_obs_g1_pois)[2], mu_THERAP1_obs_g1_pois[i,])
  THERAP2_obs_g0_rep_pois[i,] <- rpois(dim(mu_THERAP2_obs_g0_pois)[2], mu_THERAP2_obs_g0_pois[i,])
  THERAP2_obs_g1_rep_pois[i,] <- rpois(dim(mu_THERAP2_obs_g1_pois)[2], mu_THERAP2_obs_g1_pois[i,])
}


mu_PSYDR1_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PSYDR1[,is.na(HRU_PSYDR1)==FALSE & group==0]
mu_PSYDR1_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PSYDR1[,is.na(HRU_PSYDR1)==FALSE & group==1]
mu_PSYDR2_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PSYDR2[,is.na(HRU_PSYDR2)==FALSE & group==0]
mu_PSYDR2_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PSYDR2[,is.na(HRU_PSYDR2)==FALSE & group==1]
r_PSYDR1_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PSYDR1[,1]
r_PSYDR1_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PSYDR1[,1]
r_PSYDR2_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PSYDR2[,1]
r_PSYDR2_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PSYDR2[,1]
PSYDR1_obs_g0_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_PSYDR1_obs_g0_nbinom)[2])
PSYDR1_obs_g1_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_PSYDR1_obs_g1_nbinom)[2])
PSYDR2_obs_g0_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_PSYDR2_obs_g0_nbinom)[2])
PSYDR2_obs_g1_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_PSYDR2_obs_g1_nbinom)[2])
library(pscl)
set.seed(8361299)
for(i in 1:jagsModel_nbinom$n.iter){
  PSYDR1_obs_g0_rep_nbinom[i,] <- rnegbin(dim(mu_PSYDR1_obs_g0_nbinom)[2], mu=mu_PSYDR1_obs_g0_nbinom[i,], theta=r_PSYDR1_obs_g0_nbinom[i])
  PSYDR1_obs_g1_rep_nbinom[i,] <- rnegbin(dim(mu_PSYDR1_obs_g1_nbinom)[2], mu=mu_PSYDR1_obs_g1_nbinom[i,], theta=r_PSYDR1_obs_g1_nbinom[i])
  PSYDR2_obs_g0_rep_nbinom[i,] <- rnegbin(dim(mu_PSYDR2_obs_g0_nbinom)[2], mu=mu_PSYDR2_obs_g0_nbinom[i,], theta=r_PSYDR1_obs_g0_nbinom[i])
  PSYDR2_obs_g1_rep_nbinom[i,] <- rnegbin(dim(mu_PSYDR2_obs_g1_nbinom)[2], mu=mu_PSYDR2_obs_g1_nbinom[i,], theta=r_PSYDR1_obs_g1_nbinom[i])
}
mu_PSYCH1_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PSYCH1[,is.na(HRU_PSYCH1)==FALSE & group==0]
mu_PSYCH1_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PSYCH1[,is.na(HRU_PSYCH1)==FALSE & group==1]
mu_PSYCH2_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PSYCH2[,is.na(HRU_PSYCH2)==FALSE & group==0]
mu_PSYCH2_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PSYCH2[,is.na(HRU_PSYCH2)==FALSE & group==1]
r_PSYCH1_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PSYCH1[,1]
r_PSYCH1_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PSYCH1[,1]
r_PSYCH2_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PSYCH2[,1]
r_PSYCH2_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PSYCH2[,1]
PSYCH1_obs_g0_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_PSYCH1_obs_g0_nbinom)[2])
PSYCH1_obs_g1_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_PSYCH1_obs_g1_nbinom)[2])
PSYCH2_obs_g0_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_PSYCH2_obs_g0_nbinom)[2])
PSYCH2_obs_g1_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_PSYCH2_obs_g1_nbinom)[2])
set.seed(8361299)
for(i in 1:jagsModel_nbinom$n.iter){
  PSYCH1_obs_g0_rep_nbinom[i,] <- rnegbin(dim(mu_PSYCH1_obs_g0_nbinom)[2], mu=mu_PSYCH1_obs_g0_nbinom[i,], theta=r_PSYCH1_obs_g0_nbinom[i])
  PSYCH1_obs_g1_rep_nbinom[i,] <- rnegbin(dim(mu_PSYCH1_obs_g1_nbinom)[2], mu=mu_PSYCH1_obs_g1_nbinom[i,], theta=r_PSYCH1_obs_g1_nbinom[i])
  PSYCH2_obs_g0_rep_nbinom[i,] <- rnegbin(dim(mu_PSYCH2_obs_g0_nbinom)[2], mu=mu_PSYCH2_obs_g0_nbinom[i,], theta=r_PSYCH1_obs_g0_nbinom[i])
  PSYCH2_obs_g1_rep_nbinom[i,] <- rnegbin(dim(mu_PSYCH2_obs_g1_nbinom)[2], mu=mu_PSYCH2_obs_g1_nbinom[i,], theta=r_PSYCH1_obs_g1_nbinom[i])
}
mu_PHYSI1_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PHYSI1[,is.na(HRU_PHYSI1)==FALSE & group==0]
mu_PHYSI1_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PHYSI1[,is.na(HRU_PHYSI1)==FALSE & group==1]
mu_PHYSI2_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PHYSI2[,is.na(HRU_PHYSI2)==FALSE & group==0]
mu_PHYSI2_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PHYSI2[,is.na(HRU_PHYSI2)==FALSE & group==1]
r_PHYSI1_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PHYSI1[,1]
r_PHYSI1_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PHYSI1[,1]
r_PHYSI2_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PHYSI2[,1]
r_PHYSI2_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PHYSI2[,1]
PHYSI1_obs_g0_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_PHYSI1_obs_g0_nbinom)[2])
PHYSI1_obs_g1_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_PHYSI1_obs_g1_nbinom)[2])
PHYSI2_obs_g0_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_PHYSI2_obs_g0_nbinom)[2])
PHYSI2_obs_g1_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_PHYSI2_obs_g1_nbinom)[2])
set.seed(8361299)
for(i in 1:jagsModel_nbinom$n.iter){
  PHYSI1_obs_g0_rep_nbinom[i,] <- rnegbin(dim(mu_PHYSI1_obs_g0_nbinom)[2], mu=mu_PHYSI1_obs_g0_nbinom[i,], theta=r_PHYSI1_obs_g0_nbinom[i])
  PHYSI1_obs_g1_rep_nbinom[i,] <- rnegbin(dim(mu_PHYSI1_obs_g1_nbinom)[2], mu=mu_PHYSI1_obs_g1_nbinom[i,], theta=r_PHYSI1_obs_g1_nbinom[i])
  PHYSI2_obs_g0_rep_nbinom[i,] <- rnegbin(dim(mu_PHYSI2_obs_g0_nbinom)[2], mu=mu_PHYSI2_obs_g0_nbinom[i,], theta=r_PHYSI1_obs_g0_nbinom[i])
  PHYSI2_obs_g1_rep_nbinom[i,] <- rnegbin(dim(mu_PHYSI2_obs_g1_nbinom)[2], mu=mu_PHYSI2_obs_g1_nbinom[i,], theta=r_PHYSI1_obs_g1_nbinom[i])
}
mu_DENT1_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_DENT1[,is.na(HRU_DENT1)==FALSE & group==0]
mu_DENT1_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_DENT1[,is.na(HRU_DENT1)==FALSE & group==1]
mu_DENT2_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_DENT2[,is.na(HRU_DENT2)==FALSE & group==0]
mu_DENT2_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_DENT2[,is.na(HRU_DENT2)==FALSE & group==1]
r_DENT1_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_DENT1[,1]
r_DENT1_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_DENT1[,1]
r_DENT2_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_DENT2[,1]
r_DENT2_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_DENT2[,1]
DENT1_obs_g0_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_DENT1_obs_g0_nbinom)[2])
DENT1_obs_g1_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_DENT1_obs_g1_nbinom)[2])
DENT2_obs_g0_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_DENT2_obs_g0_nbinom)[2])
DENT2_obs_g1_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_DENT2_obs_g1_nbinom)[2])
set.seed(8361299)
for(i in 1:jagsModel_nbinom$n.iter){
  DENT1_obs_g0_rep_nbinom[i,] <- rnegbin(dim(mu_DENT1_obs_g0_nbinom)[2], mu=mu_DENT1_obs_g0_nbinom[i,], theta=r_DENT1_obs_g0_nbinom[i])
  DENT1_obs_g1_rep_nbinom[i,] <- rnegbin(dim(mu_DENT1_obs_g1_nbinom)[2], mu=mu_DENT1_obs_g1_nbinom[i,], theta=r_DENT1_obs_g1_nbinom[i])
  DENT2_obs_g0_rep_nbinom[i,] <- rnegbin(dim(mu_DENT2_obs_g0_nbinom)[2], mu=mu_DENT2_obs_g0_nbinom[i,], theta=r_DENT1_obs_g0_nbinom[i])
  DENT2_obs_g1_rep_nbinom[i,] <- rnegbin(dim(mu_DENT2_obs_g1_nbinom)[2], mu=mu_DENT2_obs_g1_nbinom[i,], theta=r_DENT1_obs_g1_nbinom[i])
}
mu_SOCWORK1_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_SOCWORK1[,is.na(HRU_SOCWORK1)==FALSE & group==0]
mu_SOCWORK1_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_SOCWORK1[,is.na(HRU_SOCWORK1)==FALSE & group==1]
mu_SOCWORK2_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_SOCWORK2[,is.na(HRU_SOCWORK2)==FALSE & group==0]
mu_SOCWORK2_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_SOCWORK2[,is.na(HRU_SOCWORK2)==FALSE & group==1]
r_SOCWORK1_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_SOCWORK1[,1]
r_SOCWORK1_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_SOCWORK1[,1]
r_SOCWORK2_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_SOCWORK2[,1]
r_SOCWORK2_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_SOCWORK2[,1]
SOCWORK1_obs_g0_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_SOCWORK1_obs_g0_nbinom)[2])
SOCWORK1_obs_g1_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_SOCWORK1_obs_g1_nbinom)[2])
SOCWORK2_obs_g0_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_SOCWORK2_obs_g0_nbinom)[2])
SOCWORK2_obs_g1_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_SOCWORK2_obs_g1_nbinom)[2])
set.seed(8361299)
for(i in 1:jagsModel_nbinom$n.iter){
  SOCWORK1_obs_g0_rep_nbinom[i,] <- rnegbin(dim(mu_SOCWORK1_obs_g0_nbinom)[2], mu=mu_SOCWORK1_obs_g0_nbinom[i,], theta=r_SOCWORK1_obs_g0_nbinom[i])
  SOCWORK1_obs_g1_rep_nbinom[i,] <- rnegbin(dim(mu_SOCWORK1_obs_g1_nbinom)[2], mu=mu_SOCWORK1_obs_g1_nbinom[i,], theta=r_SOCWORK1_obs_g1_nbinom[i])
  SOCWORK2_obs_g0_rep_nbinom[i,] <- rnegbin(dim(mu_SOCWORK2_obs_g0_nbinom)[2], mu=mu_SOCWORK2_obs_g0_nbinom[i,], theta=r_SOCWORK1_obs_g0_nbinom[i])
  SOCWORK2_obs_g1_rep_nbinom[i,] <- rnegbin(dim(mu_SOCWORK2_obs_g1_nbinom)[2], mu=mu_SOCWORK2_obs_g1_nbinom[i,], theta=r_SOCWORK1_obs_g1_nbinom[i])
}
mu_COMWORK1_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_COMWORK1[,is.na(HRU_COMWORK1)==FALSE & group==0]
mu_COMWORK1_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_COMWORK1[,is.na(HRU_COMWORK1)==FALSE & group==1]
mu_COMWORK2_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_COMWORK2[,is.na(HRU_COMWORK2)==FALSE & group==0]
mu_COMWORK2_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_COMWORK2[,is.na(HRU_COMWORK2)==FALSE & group==1]
r_COMWORK1_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_COMWORK1[,1]
r_COMWORK1_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_COMWORK1[,1]
r_COMWORK2_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_COMWORK2[,1]
r_COMWORK2_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_COMWORK2[,1]
COMWORK1_obs_g0_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_COMWORK1_obs_g0_nbinom)[2])
COMWORK1_obs_g1_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_COMWORK1_obs_g1_nbinom)[2])
COMWORK2_obs_g0_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_COMWORK2_obs_g0_nbinom)[2])
COMWORK2_obs_g1_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_COMWORK2_obs_g1_nbinom)[2])
set.seed(8361299)
for(i in 1:jagsModel_nbinom$n.iter){
  COMWORK1_obs_g0_rep_nbinom[i,] <- rnegbin(dim(mu_COMWORK1_obs_g0_nbinom)[2], mu=mu_COMWORK1_obs_g0_nbinom[i,], theta=r_COMWORK1_obs_g0_nbinom[i])
  COMWORK1_obs_g1_rep_nbinom[i,] <- rnegbin(dim(mu_COMWORK1_obs_g1_nbinom)[2], mu=mu_COMWORK1_obs_g1_nbinom[i,], theta=r_COMWORK1_obs_g1_nbinom[i])
  COMWORK2_obs_g0_rep_nbinom[i,] <- rnegbin(dim(mu_COMWORK2_obs_g0_nbinom)[2], mu=mu_COMWORK2_obs_g0_nbinom[i,], theta=r_COMWORK1_obs_g0_nbinom[i])
  COMWORK2_obs_g1_rep_nbinom[i,] <- rnegbin(dim(mu_COMWORK2_obs_g1_nbinom)[2], mu=mu_COMWORK2_obs_g1_nbinom[i,], theta=r_COMWORK1_obs_g1_nbinom[i])
}
mu_GP1_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_GP1[,is.na(HRU_GP1)==FALSE & group==0]
mu_GP1_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_GP1[,is.na(HRU_GP1)==FALSE & group==1]
mu_GP2_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_GP2[,is.na(HRU_GP2)==FALSE & group==0]
mu_GP2_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_GP2[,is.na(HRU_GP2)==FALSE & group==1]
r_GP1_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_GP1
r_GP1_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_GP1
r_GP2_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_GP2
r_GP2_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_GP2
GP1_obs_g0_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_GP1_obs_g0_nbinom)[2])
GP1_obs_g1_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_GP1_obs_g1_nbinom)[2])
GP2_obs_g0_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_GP2_obs_g0_nbinom)[2])
GP2_obs_g1_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_GP2_obs_g1_nbinom)[2])
set.seed(8361299)
for(i in 1:jagsModel_nbinom$n.iter){
  GP1_obs_g0_rep_nbinom[i,] <- rnegbin(dim(mu_GP1_obs_g0_nbinom)[2], mu=mu_GP1_obs_g0_nbinom[i,], theta=r_GP1_obs_g0_nbinom[i])
  GP1_obs_g1_rep_nbinom[i,] <- rnegbin(dim(mu_GP1_obs_g1_nbinom)[2], mu=mu_GP1_obs_g1_nbinom[i,], theta=r_GP1_obs_g1_nbinom[i])
  GP2_obs_g0_rep_nbinom[i,] <- rnegbin(dim(mu_GP2_obs_g0_nbinom)[2], mu=mu_GP2_obs_g0_nbinom[i,], theta=r_GP1_obs_g0_nbinom[i])
  GP2_obs_g1_rep_nbinom[i,] <- rnegbin(dim(mu_GP2_obs_g1_nbinom)[2], mu=mu_GP2_obs_g1_nbinom[i,], theta=r_GP1_obs_g1_nbinom[i])
}
mu_NURSE1_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_NURSE1[,is.na(HRU_NURSE1)==FALSE & group==0]
mu_NURSE1_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_NURSE1[,is.na(HRU_NURSE1)==FALSE & group==1]
mu_NURSE2_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_NURSE2[,is.na(HRU_NURSE2)==FALSE & group==0]
mu_NURSE2_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_NURSE2[,is.na(HRU_NURSE2)==FALSE & group==1]
r_NURSE1_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_NURSE1[,1]
r_NURSE1_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_NURSE1[,1]
r_NURSE2_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_NURSE2[,1]
r_NURSE2_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_NURSE2[,1]
NURSE1_obs_g0_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_NURSE1_obs_g0_nbinom)[2])
NURSE1_obs_g1_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_NURSE1_obs_g1_nbinom)[2])
NURSE2_obs_g0_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_NURSE2_obs_g0_nbinom)[2])
NURSE2_obs_g1_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_NURSE2_obs_g1_nbinom)[2])
set.seed(8361299)
for(i in 1:jagsModel_nbinom$n.iter){
  NURSE1_obs_g0_rep_nbinom[i,] <- rnegbin(dim(mu_NURSE1_obs_g0_nbinom)[2], mu=mu_NURSE1_obs_g0_nbinom[i,], theta=r_NURSE1_obs_g0_nbinom[i])
  NURSE1_obs_g1_rep_nbinom[i,] <- rnegbin(dim(mu_NURSE1_obs_g1_nbinom)[2], mu=mu_NURSE1_obs_g1_nbinom[i,], theta=r_NURSE1_obs_g1_nbinom[i])
  NURSE2_obs_g0_rep_nbinom[i,] <- rnegbin(dim(mu_NURSE2_obs_g0_nbinom)[2], mu=mu_NURSE2_obs_g0_nbinom[i,], theta=r_NURSE1_obs_g0_nbinom[i])
  NURSE2_obs_g1_rep_nbinom[i,] <- rnegbin(dim(mu_NURSE2_obs_g1_nbinom)[2], mu=mu_NURSE2_obs_g1_nbinom[i,], theta=r_NURSE1_obs_g1_nbinom[i])
}
mu_THERAP1_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_THERAP1[,is.na(HRU_THERAP1)==FALSE & group==0]
mu_THERAP1_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_THERAP1[,is.na(HRU_THERAP1)==FALSE & group==1]
mu_THERAP2_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_THERAP2[,is.na(HRU_THERAP2)==FALSE & group==0]
mu_THERAP2_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_THERAP2[,is.na(HRU_THERAP2)==FALSE & group==1]
r_THERAP1_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_THERAP1[,1]
r_THERAP1_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_THERAP1[,1]
r_THERAP2_obs_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_THERAP2[,1]
r_THERAP2_obs_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_THERAP2[,1]
THERAP1_obs_g0_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_THERAP1_obs_g0_nbinom)[2])
THERAP1_obs_g1_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_THERAP1_obs_g1_nbinom)[2])
THERAP2_obs_g0_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_THERAP2_obs_g0_nbinom)[2])
THERAP2_obs_g1_rep_nbinom <- matrix(NA, nrow = jagsModel_nbinom$n.iter, ncol = dim(mu_THERAP2_obs_g1_nbinom)[2])
set.seed(8361299)
for(i in 1:jagsModel_nbinom$n.iter){
  THERAP1_obs_g0_rep_nbinom[i,] <- rnegbin(dim(mu_THERAP1_obs_g0_nbinom)[2], mu=mu_THERAP1_obs_g0_nbinom[i,], theta=r_THERAP1_obs_g0_nbinom[i])
  THERAP1_obs_g1_rep_nbinom[i,] <- rnegbin(dim(mu_THERAP1_obs_g1_nbinom)[2], mu=mu_THERAP1_obs_g1_nbinom[i,], theta=r_THERAP1_obs_g1_nbinom[i])
  THERAP2_obs_g0_rep_nbinom[i,] <- rnegbin(dim(mu_THERAP2_obs_g0_nbinom)[2], mu=mu_THERAP2_obs_g0_nbinom[i,], theta=r_THERAP1_obs_g0_nbinom[i])
  THERAP2_obs_g1_rep_nbinom[i,] <- rnegbin(dim(mu_THERAP2_obs_g1_nbinom)[2], mu=mu_THERAP2_obs_g1_nbinom[i,], theta=r_THERAP1_obs_g1_nbinom[i])
}

#draw plots
color_scheme_set("red")
ppc_dens_overlay(PSYDR1_g0_obs,PSYDR1_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYDR1_g0_obs,PSYDR1_obs_g0_rep_norm[1:25,])
ppc_hist(PSYDR1_g0_obs,PSYDR1_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(PSYDR2_g0_obs,PSYDR2_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYDR2_g0_obs,PSYDR2_obs_g0_rep_norm[1:25,])
ppc_hist(PSYDR2_g0_obs,PSYDR2_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(PSYCH1_g0_obs,PSYCH1_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYCH1_g0_obs,PSYCH1_obs_g0_rep_norm[1:25,])
ppc_hist(PSYCH1_g0_obs,PSYCH1_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(PSYCH2_g0_obs,PSYCH2_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYCH2_g0_obs,PSYCH2_obs_g0_rep_norm[1:25,])
ppc_hist(PSYCH2_g0_obs,PSYCH2_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(PHYSI1_g0_obs,PHYSI1_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(PHYSI1_g0_obs,PHYSI1_obs_g0_rep_norm[1:25,])
ppc_hist(PHYSI1_g0_obs,PHYSI1_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(PHYSI2_g0_obs,PHYSI2_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(PHYSI2_g0_obs,PHYSI2_obs_g0_rep_norm[1:25,])
ppc_hist(PHYSI2_g0_obs,PHYSI2_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(DENT1_g0_obs,DENT1_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(DENT1_g0_obs,DENT1_obs_g0_rep_norm[1:25,])
ppc_hist(DENT1_g0_obs,DENT1_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(DENT2_g0_obs,DENT2_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(DENT2_g0_obs,DENT2_obs_g0_rep_norm[1:25,])
ppc_hist(DENT2_g0_obs,DENT2_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(SOCWORK1_g0_obs,SOCWORK1_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(SOCWORK1_g0_obs,SOCWORK1_obs_g0_rep_norm[1:25,])
ppc_hist(SOCWORK1_g0_obs,SOCWORK1_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(SOCWORK2_g0_obs,SOCWORK2_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(SOCWORK2_g0_obs,SOCWORK2_obs_g0_rep_norm[1:25,])
ppc_hist(SOCWORK2_g0_obs,SOCWORK2_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(COMWORK1_g0_obs,COMWORK1_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(COMWORK1_g0_obs,COMWORK1_obs_g0_rep_norm[1:25,])
ppc_hist(COMWORK1_g0_obs,COMWORK1_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(COMWORK2_g0_obs,COMWORK2_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(COMWORK2_g0_obs,COMWORK2_obs_g0_rep_norm[1:25,])
ppc_hist(COMWORK2_g0_obs,COMWORK2_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(GP1_g0_obs,GP1_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(GP1_g0_obs,GP1_obs_g0_rep_norm[1:25,])
ppc_hist(GP1_g0_obs,GP1_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(GP2_g0_obs,GP2_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(GP2_g0_obs,GP2_obs_g0_rep_norm[1:25,])
ppc_hist(GP2_g0_obs,GP2_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(NURSE1_g0_obs,NURSE1_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(NURSE1_g0_obs,NURSE1_obs_g0_rep_norm[1:25,])
ppc_hist(NURSE1_g0_obs,NURSE1_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(NURSE2_g0_obs,NURSE2_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(NURSE2_g0_obs,NURSE2_obs_g0_rep_norm[1:25,])
ppc_hist(NURSE2_g0_obs,NURSE2_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(THERAP1_g0_obs,THERAP1_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(THERAP1_g0_obs,THERAP1_obs_g0_rep_norm[1:25,])
ppc_hist(THERAP1_g0_obs,THERAP1_obs_g0_rep_norm[1:15,])
ppc_dens_overlay(THERAP2_g0_obs,THERAP2_obs_g0_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(THERAP2_g0_obs,THERAP2_obs_g0_rep_norm[1:25,])
ppc_hist(THERAP2_g0_obs,THERAP2_obs_g0_rep_norm[1:15,])

ppc_dens_overlay(PSYDR1_g0_obs,PSYDR1_obs_g0_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYDR1_g0_obs,PSYDR1_obs_g0_rep_pois[1:25,])
ppc_hist(PSYDR1_g0_obs,PSYDR1_obs_g0_rep_pois[1:15,])
ppc_dens_overlay(PSYDR2_g0_obs,PSYDR2_obs_g0_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYDR2_g0_obs,PSYDR2_obs_g0_rep_pois[1:25,])
ppc_hist(PSYDR2_g0_obs,PSYDR2_obs_g0_rep_pois[1:15,])
ppc_dens_overlay(PSYCH1_g0_obs,PSYCH1_obs_g0_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYCH1_g0_obs,PSYCH1_obs_g0_rep_pois[1:25,])
ppc_hist(PSYCH1_g0_obs,PSYCH1_obs_g0_rep_pois[1:15,])
ppc_dens_overlay(PSYCH2_g0_obs,PSYCH2_obs_g0_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYCH2_g0_obs,PSYCH2_obs_g0_rep_pois[1:25,])
ppc_hist(PSYCH2_g0_obs,PSYCH2_obs_g0_rep_pois[1:15,])
ppc_dens_overlay(PHYSI1_g0_obs,PHYSI1_obs_g0_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(PHYSI1_g0_obs,PHYSI1_obs_g0_rep_pois[1:25,])
ppc_hist(PHYSI1_g0_obs,PHYSI1_obs_g0_rep_pois[1:15,])
ppc_dens_overlay(PHYSI2_g0_obs,PHYSI2_obs_g0_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(PHYSI2_g0_obs,PHYSI2_obs_g0_rep_pois[1:25,])
ppc_hist(PHYSI2_g0_obs,PHYSI2_obs_g0_rep_pois[1:15,])
ppc_dens_overlay(DENT1_g0_obs,DENT1_obs_g0_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(DENT1_g0_obs,DENT1_obs_g0_rep_pois[1:25,])
ppc_hist(DENT1_g0_obs,DENT1_obs_g0_rep_pois[1:15,])
ppc_dens_overlay(DENT2_g0_obs,DENT2_obs_g0_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(DENT2_g0_obs,DENT2_obs_g0_rep_pois[1:25,])
ppc_hist(DENT2_g0_obs,DENT2_obs_g0_rep_pois[1:15,])
ppc_dens_overlay(SOCWORK1_g0_obs,SOCWORK1_obs_g0_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(SOCWORK1_g0_obs,SOCWORK1_obs_g0_rep_pois[1:25,])
ppc_hist(SOCWORK1_g0_obs,SOCWORK1_obs_g0_rep_pois[1:15,])
ppc_dens_overlay(SOCWORK2_g0_obs,SOCWORK2_obs_g0_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(SOCWORK2_g0_obs,SOCWORK2_obs_g0_rep_pois[1:25,])
ppc_hist(SOCWORK2_g0_obs,SOCWORK2_obs_g0_rep_pois[1:15,])
ppc_dens_overlay(COMWORK1_g0_obs,COMWORK1_obs_g0_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(COMWORK1_g0_obs,COMWORK1_obs_g0_rep_pois[1:25,])
ppc_hist(COMWORK1_g0_obs,COMWORK1_obs_g0_rep_pois[1:15,])
ppc_dens_overlay(COMWORK2_g0_obs,COMWORK2_obs_g0_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(COMWORK2_g0_obs,COMWORK2_obs_g0_rep_pois[1:25,])
ppc_hist(COMWORK2_g0_obs,COMWORK2_obs_g0_rep_pois[1:15,])
ppc_dens_overlay(GP1_g0_obs,GP1_obs_g0_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(GP1_g0_obs,GP1_obs_g0_rep_pois[1:25,])
ppc_hist(GP1_g0_obs,GP1_obs_g0_rep_pois[1:15,])
ppc_dens_overlay(GP2_g0_obs,GP2_obs_g0_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(GP2_g0_obs,GP2_obs_g0_rep_pois[1:25,])
ppc_hist(GP2_g0_obs,GP2_obs_g0_rep_pois[1:15,])
ppc_dens_overlay(NURSE1_g0_obs,NURSE1_obs_g0_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(NURSE1_g0_obs,NURSE1_obs_g0_rep_pois[1:25,])
ppc_hist(NURSE1_g0_obs,NURSE1_obs_g0_rep_pois[1:15,])
ppc_dens_overlay(NURSE2_g0_obs,NURSE2_obs_g0_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(NURSE2_g0_obs,NURSE2_obs_g0_rep_pois[1:25,])
ppc_hist(NURSE2_g0_obs,NURSE2_obs_g0_rep_pois[1:15,])
ppc_dens_overlay(THERAP1_g0_obs,THERAP1_obs_g0_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(THERAP1_g0_obs,THERAP1_obs_g0_rep_pois[1:25,])
ppc_hist(THERAP1_g0_obs,THERAP1_obs_g0_rep_pois[1:15,])
ppc_dens_overlay(THERAP2_g0_obs,THERAP2_obs_g0_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(THERAP2_g0_obs,THERAP2_obs_g0_rep_pois[1:25,])
ppc_hist(THERAP2_g0_obs,THERAP2_obs_g0_rep_pois[1:15,])

ppc_dens_overlay(PSYDR1_g0_obs,PSYDR1_obs_g0_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYDR1_g0_obs,PSYDR1_obs_g0_rep_nbinom[1:25,])
ppc_hist(PSYDR1_g0_obs,PSYDR1_obs_g0_rep_nbinom[1:15,])
ppc_dens_overlay(PSYDR2_g0_obs,PSYDR2_obs_g0_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYDR2_g0_obs,PSYDR2_obs_g0_rep_nbinom[1:25,])
ppc_hist(PSYDR2_g0_obs,PSYDR2_obs_g0_rep_nbinom[1:15,])
ppc_dens_overlay(PSYCH1_g0_obs,PSYCH1_obs_g0_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYCH1_g0_obs,PSYCH1_obs_g0_rep_nbinom[1:25,])
ppc_hist(PSYCH1_g0_obs,PSYCH1_obs_g0_rep_nbinom[1:15,])
ppc_dens_overlay(PSYCH2_g0_obs,PSYCH2_obs_g0_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYCH2_g0_obs,PSYCH2_obs_g0_rep_nbinom[1:25,])
ppc_hist(PSYCH2_g0_obs,PSYCH2_obs_g0_rep_nbinom[1:15,])
ppc_dens_overlay(PHYSI1_g0_obs,PHYSI1_obs_g0_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(PHYSI1_g0_obs,PHYSI1_obs_g0_rep_nbinom[1:25,])
ppc_hist(PHYSI1_g0_obs,PHYSI1_obs_g0_rep_nbinom[1:15,])
ppc_dens_overlay(PHYSI2_g0_obs,PHYSI2_obs_g0_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(PHYSI2_g0_obs,PHYSI2_obs_g0_rep_nbinom[1:25,])
ppc_hist(PHYSI2_g0_obs,PHYSI2_obs_g0_rep_nbinom[1:15,])
ppc_dens_overlay(DENT1_g0_obs,DENT1_obs_g0_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(DENT1_g0_obs,DENT1_obs_g0_rep_nbinom[1:25,])
ppc_hist(DENT1_g0_obs,DENT1_obs_g0_rep_nbinom[1:15,])
ppc_dens_overlay(DENT2_g0_obs,DENT2_obs_g0_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(DENT2_g0_obs,DENT2_obs_g0_rep_nbinom[1:25,])
ppc_hist(DENT2_g0_obs,DENT2_obs_g0_rep_nbinom[1:15,])
ppc_dens_overlay(SOCWORK1_g0_obs,SOCWORK1_obs_g0_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(SOCWORK1_g0_obs,SOCWORK1_obs_g0_rep_nbinom[1:25,])
ppc_hist(SOCWORK1_g0_obs,SOCWORK1_obs_g0_rep_nbinom[1:15,])
ppc_dens_overlay(SOCWORK2_g0_obs,SOCWORK2_obs_g0_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(SOCWORK2_g0_obs,SOCWORK2_obs_g0_rep_nbinom[1:25,])
ppc_hist(SOCWORK2_g0_obs,SOCWORK2_obs_g0_rep_nbinom[1:15,])
ppc_dens_overlay(COMWORK1_g0_obs,COMWORK1_obs_g0_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(COMWORK1_g0_obs,COMWORK1_obs_g0_rep_nbinom[1:25,])
ppc_hist(COMWORK1_g0_obs,COMWORK1_obs_g0_rep_nbinom[1:15,])
ppc_dens_overlay(COMWORK2_g0_obs,COMWORK2_obs_g0_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(COMWORK2_g0_obs,COMWORK2_obs_g0_rep_nbinom[1:25,])
ppc_hist(COMWORK2_g0_obs,COMWORK2_obs_g0_rep_nbinom[1:15,])
ppc_dens_overlay(GP1_g0_obs,GP1_obs_g0_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(GP1_g0_obs,GP1_obs_g0_rep_nbinom[1:25,])
ppc_hist(GP1_g0_obs,GP1_obs_g0_rep_nbinom[1:15,])
ppc_dens_overlay(GP2_g0_obs,GP2_obs_g0_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(GP2_g0_obs,GP2_obs_g0_rep_nbinom[1:25,])
ppc_hist(GP2_g0_obs,GP2_obs_g0_rep_nbinom[1:15,])
ppc_dens_overlay(NURSE1_g0_obs,NURSE1_obs_g0_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(NURSE1_g0_obs,NURSE1_obs_g0_rep_nbinom[1:25,])
ppc_hist(NURSE1_g0_obs,NURSE1_obs_g0_rep_nbinom[1:15,])
ppc_dens_overlay(NURSE2_g0_obs,NURSE2_obs_g0_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(NURSE2_g0_obs,NURSE2_obs_g0_rep_nbinom[1:25,])
ppc_hist(NURSE2_g0_obs,NURSE2_obs_g0_rep_nbinom[1:15,])
ppc_dens_overlay(THERAP1_g0_obs,THERAP1_obs_g0_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(THERAP1_g0_obs,THERAP1_obs_g0_rep_nbinom[1:25,])
ppc_hist(THERAP1_g0_obs,THERAP1_obs_g0_rep_nbinom[1:15,])
ppc_dens_overlay(THERAP2_g0_obs,THERAP2_obs_g0_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(THERAP2_g0_obs,THERAP2_obs_g0_rep_nbinom[1:25,])
ppc_hist(THERAP2_g0_obs,THERAP2_obs_g0_rep_nbinom[1:15,])


color_scheme_set("blue")
ppc_dens_overlay(PSYDR1_g1_obs,PSYDR1_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYDR1_g1_obs,PSYDR1_obs_g1_rep_norm[1:25,])
ppc_hist(PSYDR1_g1_obs,PSYDR1_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(PSYDR2_g1_obs,PSYDR2_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYDR2_g1_obs,PSYDR2_obs_g1_rep_norm[1:25,])
ppc_hist(PSYDR2_g1_obs,PSYDR2_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(PSYCH1_g1_obs,PSYCH1_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYCH1_g1_obs,PSYCH1_obs_g1_rep_norm[1:25,])
ppc_hist(PSYCH1_g1_obs,PSYCH1_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(PSYCH2_g1_obs,PSYCH2_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYCH2_g1_obs,PSYCH2_obs_g1_rep_norm[1:25,])
ppc_hist(PSYCH2_g1_obs,PSYCH2_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(PHYSI1_g1_obs,PHYSI1_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(PHYSI1_g1_obs,PHYSI1_obs_g1_rep_norm[1:25,])
ppc_hist(PHYSI1_g1_obs,PHYSI1_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(PHYSI2_g1_obs,PHYSI2_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(PHYSI2_g1_obs,PHYSI2_obs_g1_rep_norm[1:25,])
ppc_hist(PHYSI2_g1_obs,PHYSI2_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(DENT1_g1_obs,DENT1_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(DENT1_g1_obs,DENT1_obs_g1_rep_norm[1:25,])
ppc_hist(DENT1_g1_obs,DENT1_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(DENT2_g1_obs,DENT2_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(DENT2_g1_obs,DENT2_obs_g1_rep_norm[1:25,])
ppc_hist(DENT2_g1_obs,DENT2_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(SOCWORK1_g1_obs,SOCWORK1_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(SOCWORK1_g1_obs,SOCWORK1_obs_g1_rep_norm[1:25,])
ppc_hist(SOCWORK1_g1_obs,SOCWORK1_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(SOCWORK2_g1_obs,SOCWORK2_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(SOCWORK2_g1_obs,SOCWORK2_obs_g1_rep_norm[1:25,])
ppc_hist(SOCWORK2_g1_obs,SOCWORK2_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(COMWORK1_g1_obs,COMWORK1_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(COMWORK1_g1_obs,COMWORK1_obs_g1_rep_norm[1:25,])
ppc_hist(COMWORK1_g1_obs,COMWORK1_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(COMWORK2_g1_obs,COMWORK2_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(COMWORK2_g1_obs,COMWORK2_obs_g1_rep_norm[1:25,])
ppc_hist(COMWORK2_g1_obs,COMWORK2_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(GP1_g1_obs,GP1_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(GP1_g1_obs,GP1_obs_g1_rep_norm[1:25,])
ppc_hist(GP1_g1_obs,GP1_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(GP2_g1_obs,GP2_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(GP2_g1_obs,GP2_obs_g1_rep_norm[1:25,])
ppc_hist(GP2_g1_obs,GP2_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(NURSE1_g1_obs,NURSE1_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(NURSE1_g1_obs,NURSE1_obs_g1_rep_norm[1:25,])
ppc_hist(NURSE1_g1_obs,NURSE1_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(NURSE2_g1_obs,NURSE2_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(NURSE2_g1_obs,NURSE2_obs_g1_rep_norm[1:25,])
ppc_hist(NURSE2_g1_obs,NURSE2_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(THERAP1_g1_obs,THERAP1_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(THERAP1_g1_obs,THERAP1_obs_g1_rep_norm[1:25,])
ppc_hist(THERAP1_g1_obs,THERAP1_obs_g1_rep_norm[1:15,])
ppc_dens_overlay(THERAP2_g1_obs,THERAP2_obs_g1_rep_norm[1:25,], bw=0.25)
ppc_ecdf_overlay(THERAP2_g1_obs,THERAP2_obs_g1_rep_norm[1:25,])
ppc_hist(THERAP2_g1_obs,THERAP2_obs_g1_rep_norm[1:15,])

ppc_dens_overlay(PSYDR1_g1_obs,PSYDR1_obs_g1_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYDR1_g1_obs,PSYDR1_obs_g1_rep_pois[1:25,])
ppc_hist(PSYDR1_g1_obs,PSYDR1_obs_g1_rep_pois[1:15,])
ppc_dens_overlay(PSYDR2_g1_obs,PSYDR2_obs_g1_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYDR2_g1_obs,PSYDR2_obs_g1_rep_pois[1:25,])
ppc_hist(PSYDR2_g1_obs,PSYDR2_obs_g1_rep_pois[1:15,])
ppc_dens_overlay(PSYCH1_g1_obs,PSYCH1_obs_g1_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYCH1_g1_obs,PSYCH1_obs_g1_rep_pois[1:25,])
ppc_hist(PSYCH1_g1_obs,PSYCH1_obs_g1_rep_pois[1:15,])
ppc_dens_overlay(PSYCH2_g1_obs,PSYCH2_obs_g1_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYCH2_g1_obs,PSYCH2_obs_g1_rep_pois[1:25,])
ppc_hist(PSYCH2_g1_obs,PSYCH2_obs_g1_rep_pois[1:15,])
ppc_dens_overlay(PHYSI1_g1_obs,PHYSI1_obs_g1_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(PHYSI1_g1_obs,PHYSI1_obs_g1_rep_pois[1:25,])
ppc_hist(PHYSI1_g1_obs,PHYSI1_obs_g1_rep_pois[1:15,])
ppc_dens_overlay(PHYSI2_g1_obs,PHYSI2_obs_g1_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(PHYSI2_g1_obs,PHYSI2_obs_g1_rep_pois[1:25,])
ppc_hist(PHYSI2_g1_obs,PHYSI2_obs_g1_rep_pois[1:15,])
ppc_dens_overlay(DENT1_g1_obs,DENT1_obs_g1_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(DENT1_g1_obs,DENT1_obs_g1_rep_pois[1:25,])
ppc_hist(DENT1_g1_obs,DENT1_obs_g1_rep_pois[1:15,])
ppc_dens_overlay(DENT2_g1_obs,DENT2_obs_g1_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(DENT2_g1_obs,DENT2_obs_g1_rep_pois[1:25,])
ppc_hist(DENT2_g1_obs,DENT2_obs_g1_rep_pois[1:15,])
ppc_dens_overlay(SOCWORK1_g1_obs,SOCWORK1_obs_g1_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(SOCWORK1_g1_obs,SOCWORK1_obs_g1_rep_pois[1:25,])
ppc_hist(SOCWORK1_g1_obs,SOCWORK1_obs_g1_rep_pois[1:15,])
ppc_dens_overlay(SOCWORK2_g1_obs,SOCWORK2_obs_g1_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(SOCWORK2_g1_obs,SOCWORK2_obs_g1_rep_pois[1:25,])
ppc_hist(SOCWORK2_g1_obs,SOCWORK2_obs_g1_rep_pois[1:15,])
ppc_dens_overlay(COMWORK1_g1_obs,COMWORK1_obs_g1_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(COMWORK1_g1_obs,COMWORK1_obs_g1_rep_pois[1:25,])
ppc_hist(COMWORK1_g1_obs,COMWORK1_obs_g1_rep_pois[1:15,])
ppc_dens_overlay(COMWORK2_g1_obs,COMWORK2_obs_g1_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(COMWORK2_g1_obs,COMWORK2_obs_g1_rep_pois[1:25,])
ppc_hist(COMWORK2_g1_obs,COMWORK2_obs_g1_rep_pois[1:15,])
ppc_dens_overlay(GP1_g1_obs,GP1_obs_g1_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(GP1_g1_obs,GP1_obs_g1_rep_pois[1:25,])
ppc_hist(GP1_g1_obs,GP1_obs_g1_rep_pois[1:15,])
ppc_dens_overlay(GP2_g1_obs,GP2_obs_g1_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(GP2_g1_obs,GP2_obs_g1_rep_pois[1:25,])
ppc_hist(GP2_g1_obs,GP2_obs_g1_rep_pois[1:15,])
ppc_dens_overlay(NURSE1_g1_obs,NURSE1_obs_g1_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(NURSE1_g1_obs,NURSE1_obs_g1_rep_pois[1:25,])
ppc_hist(NURSE1_g1_obs,NURSE1_obs_g1_rep_pois[1:15,])
ppc_dens_overlay(NURSE2_g1_obs,NURSE2_obs_g1_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(NURSE2_g1_obs,NURSE2_obs_g1_rep_pois[1:25,])
ppc_hist(NURSE2_g1_obs,NURSE2_obs_g1_rep_pois[1:15,])
ppc_dens_overlay(THERAP1_g1_obs,THERAP1_obs_g1_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(THERAP1_g1_obs,THERAP1_obs_g1_rep_pois[1:25,])
ppc_hist(THERAP1_g1_obs,THERAP1_obs_g1_rep_pois[1:15,])
ppc_dens_overlay(THERAP2_g1_obs,THERAP2_obs_g1_rep_pois[1:25,], bw=0.25)
ppc_ecdf_overlay(THERAP2_g1_obs,THERAP2_obs_g1_rep_pois[1:25,])
ppc_hist(THERAP2_g1_obs,THERAP2_obs_g1_rep_pois[1:15,])


ppc_dens_overlay(PSYDR1_g1_obs,PSYDR1_obs_g1_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYDR1_g1_obs,PSYDR1_obs_g1_rep_nbinom[1:25,])
ppc_hist(PSYDR1_g1_obs,PSYDR1_obs_g1_rep_nbinom[1:15,])
ppc_dens_overlay(PSYDR2_g1_obs,PSYDR2_obs_g1_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYDR2_g1_obs,PSYDR2_obs_g1_rep_nbinom[1:25,])
ppc_hist(PSYDR2_g1_obs,PSYDR2_obs_g1_rep_nbinom[1:15,])
ppc_dens_overlay(PSYCH1_g1_obs,PSYCH1_obs_g1_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYCH1_g1_obs,PSYCH1_obs_g1_rep_nbinom[1:25,])
ppc_hist(PSYCH1_g1_obs,PSYCH1_obs_g1_rep_nbinom[1:15,])
ppc_dens_overlay(PSYCH2_g1_obs,PSYCH2_obs_g1_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(PSYCH2_g1_obs,PSYCH2_obs_g1_rep_nbinom[1:25,])
ppc_hist(PSYCH2_g1_obs,PSYCH2_obs_g1_rep_nbinom[1:15,])
ppc_dens_overlay(PHYSI1_g1_obs,PHYSI1_obs_g1_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(PHYSI1_g1_obs,PHYSI1_obs_g1_rep_nbinom[1:25,])
ppc_hist(PHYSI1_g1_obs,PHYSI1_obs_g1_rep_nbinom[1:15,])
ppc_dens_overlay(PHYSI2_g1_obs,PHYSI2_obs_g1_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(PHYSI2_g1_obs,PHYSI2_obs_g1_rep_nbinom[1:25,])
ppc_hist(PHYSI2_g1_obs,PHYSI2_obs_g1_rep_nbinom[1:15,])
ppc_dens_overlay(DENT1_g1_obs,DENT1_obs_g1_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(DENT1_g1_obs,DENT1_obs_g1_rep_nbinom[1:25,])
ppc_hist(DENT1_g1_obs,DENT1_obs_g1_rep_nbinom[1:15,])
ppc_dens_overlay(DENT2_g1_obs,DENT2_obs_g1_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(DENT2_g1_obs,DENT2_obs_g1_rep_nbinom[1:25,])
ppc_hist(DENT2_g1_obs,DENT2_obs_g1_rep_nbinom[1:15,])
ppc_dens_overlay(SOCWORK1_g1_obs,SOCWORK1_obs_g1_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(SOCWORK1_g1_obs,SOCWORK1_obs_g1_rep_nbinom[1:25,])
ppc_hist(SOCWORK1_g1_obs,SOCWORK1_obs_g1_rep_nbinom[1:15,])
ppc_dens_overlay(SOCWORK2_g1_obs,SOCWORK2_obs_g1_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(SOCWORK2_g1_obs,SOCWORK2_obs_g1_rep_nbinom[1:25,])
ppc_hist(SOCWORK2_g1_obs,SOCWORK2_obs_g1_rep_nbinom[1:15,])
ppc_dens_overlay(COMWORK1_g1_obs,COMWORK1_obs_g1_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(COMWORK1_g1_obs,COMWORK1_obs_g1_rep_nbinom[1:25,])
ppc_hist(COMWORK1_g1_obs,COMWORK1_obs_g1_rep_nbinom[1:15,])
ppc_dens_overlay(COMWORK2_g1_obs,COMWORK2_obs_g1_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(COMWORK2_g1_obs,COMWORK2_obs_g1_rep_nbinom[1:25,])
ppc_hist(COMWORK2_g1_obs,COMWORK2_obs_g1_rep_nbinom[1:15,])
ppc_dens_overlay(GP1_g1_obs,GP1_obs_g1_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(GP1_g1_obs,GP1_obs_g1_rep_nbinom[1:25,])
ppc_hist(GP1_g1_obs,GP1_obs_g1_rep_nbinom[1:15,])
ppc_dens_overlay(GP2_g1_obs,GP2_obs_g1_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(GP2_g1_obs,GP2_obs_g1_rep_nbinom[1:25,])
ppc_hist(GP2_g1_obs,GP2_obs_g1_rep_nbinom[1:15,])
ppc_dens_overlay(NURSE1_g1_obs,NURSE1_obs_g1_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(NURSE1_g1_obs,NURSE1_obs_g1_rep_nbinom[1:25,])
ppc_hist(NURSE1_g1_obs,NURSE1_obs_g1_rep_nbinom[1:15,])
ppc_dens_overlay(NURSE2_g1_obs,NURSE2_obs_g1_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(NURSE2_g1_obs,NURSE2_obs_g1_rep_nbinom[1:25,])
ppc_hist(NURSE2_g1_obs,NURSE2_obs_g1_rep_nbinom[1:15,])
ppc_dens_overlay(THERAP1_g1_obs,THERAP1_obs_g1_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(THERAP1_g1_obs,THERAP1_obs_g1_rep_nbinom[1:25,])
ppc_hist(THERAP1_g1_obs,THERAP1_obs_g1_rep_nbinom[1:15,])
ppc_dens_overlay(THERAP2_g1_obs,THERAP2_obs_g1_rep_nbinom[1:25,], bw=0.25)
ppc_ecdf_overlay(THERAP2_g1_obs,THERAP2_obs_g1_rep_nbinom[1:25,])
ppc_hist(THERAP2_g1_obs,THERAP2_obs_g1_rep_nbinom[1:15,])

#generate posterior means by MC 
set.seed(8361299)
L <- 10000
#approximate marginal mean outcome per group from each model
mu_PSYDR1_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PSYDR1[,group==0]
mu_PSYDR1_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PSYDR1[,group==1]
mu_PSYDR2_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PSYDR2[,group==0]
mu_PSYDR2_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PSYDR2[,group==1]
sd_PSYDR1_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PSYDR1[,1,1]
sd_PSYDR1_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PSYDR1[,2,1]
sd_PSYDR2_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PSYDR2[,1,1]
sd_PSYDR2_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PSYDR2[,2,1]
mmu_PSYDR1_g0_norm <- mmu_PSYDR1_g1_norm <- c()
mmu_PSYDR2_g0_norm <- mmu_PSYDR2_g1_norm <- c()
for(i in 1:jagsModel_norm$n.iter){
    mmu_PSYDR1_g0_norm[i] <- mean(rnorm(L, mu_PSYDR1_g0_norm[i,], sd_PSYDR1_g0_norm[i]))
    mmu_PSYDR1_g1_norm[i] <- mean(rnorm(L, mu_PSYDR1_g1_norm[i,], sd_PSYDR1_g1_norm[i]))
    mmu_PSYDR2_g0_norm[i] <- mean(rnorm(L, mu_PSYDR2_g0_norm[i,], sd_PSYDR2_g0_norm[i]))
    mmu_PSYDR2_g1_norm[i] <- mean(rnorm(L, mu_PSYDR2_g1_norm[i,], sd_PSYDR2_g1_norm[i]))
}
mu_PSYCH1_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PSYCH1[,group==0]
mu_PSYCH1_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PSYCH1[,group==1]
mu_PSYCH2_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PSYCH2[,group==0]
mu_PSYCH2_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PSYCH2[,group==1]
sd_PSYCH1_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PSYCH1[,1,1]
sd_PSYCH1_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PSYCH1[,2,1]
sd_PSYCH2_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PSYCH2[,1,1]
sd_PSYCH2_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PSYCH2[,2,1]
mmu_PSYCH1_g0_norm <- mmu_PSYCH1_g1_norm <- c()
mmu_PSYCH2_g0_norm <- mmu_PSYCH2_g1_norm <- c()
for(i in 1:jagsModel_norm$n.iter){
  mmu_PSYCH1_g0_norm[i] <- mean(rnorm(L, mu_PSYCH1_g0_norm[i,], sd_PSYCH1_g0_norm[i]))
  mmu_PSYCH1_g1_norm[i] <- mean(rnorm(L, mu_PSYCH1_g1_norm[i,], sd_PSYCH1_g1_norm[i]))
  mmu_PSYCH2_g0_norm[i] <- mean(rnorm(L, mu_PSYCH2_g0_norm[i,], sd_PSYCH2_g0_norm[i]))
  mmu_PSYCH2_g1_norm[i] <- mean(rnorm(L, mu_PSYCH2_g1_norm[i,], sd_PSYCH2_g1_norm[i]))
}
mu_PHYSI1_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PHYSI1[,group==0]
mu_PHYSI1_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PHYSI1[,group==1]
mu_PHYSI2_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PHYSI2[,group==0]
mu_PHYSI2_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_PHYSI2[,group==1]
sd_PHYSI1_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PHYSI1[,1,1]
sd_PHYSI1_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PHYSI1[,2,1]
sd_PHYSI2_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PHYSI2[,1,1]
sd_PHYSI2_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_PHYSI2[,2,1]
mmu_PHYSI1_g0_norm <- mmu_PHYSI1_g1_norm <- c()
mmu_PHYSI2_g0_norm <- mmu_PHYSI2_g1_norm <- c()
for(i in 1:jagsModel_norm$n.iter){
    mmu_PHYSI1_g0_norm[i] <- mean(rnorm(L, mu_PHYSI1_g0_norm[i,], sd_PHYSI1_g0_norm[i]))
    mmu_PHYSI1_g1_norm[i] <- mean(rnorm(L, mu_PHYSI1_g1_norm[i,], sd_PHYSI1_g1_norm[i]))
    mmu_PHYSI2_g0_norm[i] <- mean(rnorm(L, mu_PHYSI2_g0_norm[i,], sd_PHYSI2_g0_norm[i]))
    mmu_PHYSI2_g1_norm[i] <- mean(rnorm(L, mu_PHYSI2_g1_norm[i,], sd_PHYSI2_g1_norm[i]))
}
mu_DENT1_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_DENT1[,group==0]
mu_DENT1_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_DENT1[,group==1]
mu_DENT2_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_DENT2[,group==0]
mu_DENT2_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_DENT2[,group==1]
sd_DENT1_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_DENT1[,1,1]
sd_DENT1_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_DENT1[,2,1]
sd_DENT2_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_DENT2[,1,1]
sd_DENT2_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_DENT2[,2,1]
mmu_DENT1_g0_norm <- mmu_DENT1_g1_norm <- c()
mmu_DENT2_g0_norm <- mmu_DENT2_g1_norm <- c()
for(i in 1:jagsModel_norm$n.iter){
  mmu_DENT1_g0_norm[i] <- mean(rnorm(L, mu_DENT1_g0_norm[i,], sd_DENT1_g0_norm[i]))
  mmu_DENT1_g1_norm[i] <- mean(rnorm(L, mu_DENT1_g1_norm[i,], sd_DENT1_g1_norm[i]))
  mmu_DENT2_g0_norm[i] <- mean(rnorm(L, mu_DENT2_g0_norm[i,], sd_DENT2_g0_norm[i]))
  mmu_DENT2_g1_norm[i] <- mean(rnorm(L, mu_DENT2_g1_norm[i,], sd_DENT2_g1_norm[i]))
}
mu_SOCWORK1_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_SOCWORK1[,group==0]
mu_SOCWORK1_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_SOCWORK1[,group==1]
mu_SOCWORK2_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_SOCWORK2[,group==0]
mu_SOCWORK2_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_SOCWORK2[,group==1]
sd_SOCWORK1_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_SOCWORK1[,1,1]
sd_SOCWORK1_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_SOCWORK1[,2,1]
sd_SOCWORK2_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_SOCWORK2[,1,1]
sd_SOCWORK2_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_SOCWORK2[,2,1]
mmu_SOCWORK1_g0_norm <- mmu_SOCWORK1_g1_norm <- c()
mmu_SOCWORK2_g0_norm <- mmu_SOCWORK2_g1_norm <- c()
for(i in 1:jagsModel_norm$n.iter){
  mmu_SOCWORK1_g0_norm[i] <- mean(rnorm(L, mu_SOCWORK1_g0_norm[i,], sd_SOCWORK1_g0_norm[i]))
  mmu_SOCWORK1_g1_norm[i] <- mean(rnorm(L, mu_SOCWORK1_g1_norm[i,], sd_SOCWORK1_g1_norm[i]))
  mmu_SOCWORK2_g0_norm[i] <- mean(rnorm(L, mu_SOCWORK2_g0_norm[i,], sd_SOCWORK2_g0_norm[i]))
  mmu_SOCWORK2_g1_norm[i] <- mean(rnorm(L, mu_SOCWORK2_g1_norm[i,], sd_SOCWORK2_g1_norm[i]))
}
mu_COMWORK1_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_COMWORK1[,group==0]
mu_COMWORK1_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_COMWORK1[,group==1]
mu_COMWORK2_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_COMWORK2[,group==0]
mu_COMWORK2_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_COMWORK2[,group==1]
sd_COMWORK1_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_COMWORK1[,1,1]
sd_COMWORK1_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_COMWORK1[,2,1]
sd_COMWORK2_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_COMWORK2[,1,1]
sd_COMWORK2_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_COMWORK2[,2,1]
mmu_COMWORK1_g0_norm <- mmu_COMWORK1_g1_norm <- c()
mmu_COMWORK2_g0_norm <- mmu_COMWORK2_g1_norm <- c()
for(i in 1:jagsModel_norm$n.iter){
  mmu_COMWORK1_g0_norm[i] <- mean(rnorm(L, mu_COMWORK1_g0_norm[i,], sd_COMWORK1_g0_norm[i]))
  mmu_COMWORK1_g1_norm[i] <- mean(rnorm(L, mu_COMWORK1_g1_norm[i,], sd_COMWORK1_g1_norm[i]))
  mmu_COMWORK2_g0_norm[i] <- mean(rnorm(L, mu_COMWORK2_g0_norm[i,], sd_COMWORK2_g0_norm[i]))
  mmu_COMWORK2_g1_norm[i] <- mean(rnorm(L, mu_COMWORK2_g1_norm[i,], sd_COMWORK2_g1_norm[i]))
}
mu_GP1_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_GP1[,group==0]
mu_GP1_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_GP1[,group==1]
mu_GP2_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_GP2[,group==0]
mu_GP2_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_GP2[,group==1]
sd_GP1_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_GP1[,1]
sd_GP1_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_GP1[,2]
sd_GP2_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_GP2[,1]
sd_GP2_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_GP2[,2]
mmu_GP1_g0_norm <- mmu_GP1_g1_norm <- c()
mmu_GP2_g0_norm <- mmu_GP2_g1_norm <- c()
for(i in 1:jagsModel_norm$n.iter){
  mmu_GP1_g0_norm[i] <- mean(rnorm(L, mu_GP1_g0_norm[i,], sd_GP1_g0_norm[i]))
  mmu_GP1_g1_norm[i] <- mean(rnorm(L, mu_GP1_g1_norm[i,], sd_GP1_g1_norm[i]))
  mmu_GP2_g0_norm[i] <- mean(rnorm(L, mu_GP2_g0_norm[i,], sd_GP2_g0_norm[i]))
  mmu_GP2_g1_norm[i] <- mean(rnorm(L, mu_GP2_g1_norm[i,], sd_GP2_g1_norm[i]))
}
mu_NURSE1_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_NURSE1[,group==0]
mu_NURSE1_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_NURSE1[,group==1]
mu_NURSE2_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_NURSE2[,group==0]
mu_NURSE2_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_NURSE2[,group==1]
sd_NURSE1_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_NURSE1[,1,1]
sd_NURSE1_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_NURSE1[,2,1]
sd_NURSE2_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_NURSE2[,1,1]
sd_NURSE2_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_NURSE2[,2,1]
mmu_NURSE1_g0_norm <- mmu_NURSE1_g1_norm <- c()
mmu_NURSE2_g0_norm <- mmu_NURSE2_g1_norm <- c()
for(i in 1:jagsModel_norm$n.iter){
  mmu_NURSE1_g0_norm[i] <- mean(rnorm(L, mu_NURSE1_g0_norm[i,], sd_NURSE1_g0_norm[i]))
  mmu_NURSE1_g1_norm[i] <- mean(rnorm(L, mu_NURSE1_g1_norm[i,], sd_NURSE1_g1_norm[i]))
  mmu_NURSE2_g0_norm[i] <- mean(rnorm(L, mu_NURSE2_g0_norm[i,], sd_NURSE2_g0_norm[i]))
  mmu_NURSE2_g1_norm[i] <- mean(rnorm(L, mu_NURSE2_g1_norm[i,], sd_NURSE2_g1_norm[i]))
}
mu_THERAP1_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_THERAP1[,group==0]
mu_THERAP1_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_THERAP1[,group==1]
mu_THERAP2_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_THERAP2[,group==0]
mu_THERAP2_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$mu_THERAP2[,group==1]
sd_THERAP1_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_THERAP1[,1,1]
sd_THERAP1_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_THERAP1[,2,1]
sd_THERAP2_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_THERAP2[,1,1]
sd_THERAP2_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$sd_THERAP2[,2,1]
mmu_THERAP1_g0_norm <- mmu_THERAP1_g1_norm <- c()
mmu_THERAP2_g0_norm <- mmu_THERAP2_g1_norm <- c()
for(i in 1:jagsModel_norm$n.iter){
  mmu_THERAP1_g0_norm[i] <- mean(rnorm(L, mu_THERAP1_g0_norm[i,], sd_THERAP1_g0_norm[i]))
  mmu_THERAP1_g1_norm[i] <- mean(rnorm(L, mu_THERAP1_g1_norm[i,], sd_THERAP1_g1_norm[i]))
  mmu_THERAP2_g0_norm[i] <- mean(rnorm(L, mu_THERAP2_g0_norm[i,], sd_THERAP2_g0_norm[i]))
  mmu_THERAP2_g1_norm[i] <- mean(rnorm(L, mu_THERAP2_g1_norm[i,], sd_THERAP2_g1_norm[i]))
}



set.seed(8361299)
mu_PSYDR1_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PSYDR1[,group==0]
mu_PSYDR1_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PSYDR1[,group==1]
mu_PSYDR2_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PSYDR2[,group==0]
mu_PSYDR2_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PSYDR2[,group==1]
mmu_PSYDR1_g0_pois <- mmu_PSYDR1_g1_pois <- c()
mmu_PSYDR2_g0_pois <- mmu_PSYDR2_g1_pois <- c()
for(i in 1:jagsModel_pois$n.iter){
    mmu_PSYDR1_g0_pois[i] <- mean(rpois(L, mu_PSYDR1_g0_pois[i,]))
    mmu_PSYDR1_g1_pois[i] <- mean(rpois(L, mu_PSYDR1_g1_pois[i,]))
    mmu_PSYDR2_g0_pois[i] <- mean(rpois(L, mu_PSYDR2_g0_pois[i,]))
    mmu_PSYDR2_g1_pois[i] <- mean(rpois(L, mu_PSYDR2_g1_pois[i,]))
}
mu_PSYCH1_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PSYCH1[,group==0]
mu_PSYCH1_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PSYCH1[,group==1]
mu_PSYCH2_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PSYCH2[,group==0]
mu_PSYCH2_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PSYCH2[,group==1]
mmu_PSYCH1_g0_pois <- mmu_PSYCH1_g1_pois <- c()
mmu_PSYCH2_g0_pois <- mmu_PSYCH2_g1_pois <- c()
for(i in 1:jagsModel_pois$n.iter){
  mmu_PSYCH1_g0_pois[i] <- mean(rpois(L, mu_PSYCH1_g0_pois[i,]))
  mmu_PSYCH1_g1_pois[i] <- mean(rpois(L, mu_PSYCH1_g1_pois[i,]))
  mmu_PSYCH2_g0_pois[i] <- mean(rpois(L, mu_PSYCH2_g0_pois[i,]))
  mmu_PSYCH2_g1_pois[i] <- mean(rpois(L, mu_PSYCH2_g1_pois[i,]))
}
mu_PHYSI1_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PHYSI1[,group==0]
mu_PHYSI1_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PHYSI1[,group==1]
mu_PHYSI2_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PHYSI2[,group==0]
mu_PHYSI2_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_PHYSI2[,group==1]
mmu_PHYSI1_g0_pois <- mmu_PHYSI1_g1_pois <- c()
mmu_PHYSI2_g0_pois <- mmu_PHYSI2_g1_pois <- c()
for(i in 1:jagsModel_pois$n.iter){
  mmu_PHYSI1_g0_pois[i] <- mean(rpois(L, mu_PHYSI1_g0_pois[i,]))
  mmu_PHYSI1_g1_pois[i] <- mean(rpois(L, mu_PHYSI1_g1_pois[i,]))
  mmu_PHYSI2_g0_pois[i] <- mean(rpois(L, mu_PHYSI2_g0_pois[i,]))
  mmu_PHYSI2_g1_pois[i] <- mean(rpois(L, mu_PHYSI2_g1_pois[i,]))
}
mu_DENT1_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_DENT1[,group==0]
mu_DENT1_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_DENT1[,group==1]
mu_DENT2_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_DENT2[,group==0]
mu_DENT2_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_DENT2[,group==1]
mmu_DENT1_g0_pois <- mmu_DENT1_g1_pois <- c()
mmu_DENT2_g0_pois <- mmu_DENT2_g1_pois <- c()
for(i in 1:jagsModel_pois$n.iter){
  mmu_DENT1_g0_pois[i] <- mean(rpois(L, mu_DENT1_g0_pois[i,]))
  mmu_DENT1_g1_pois[i] <- mean(rpois(L, mu_DENT1_g1_pois[i,]))
  mmu_DENT2_g0_pois[i] <- mean(rpois(L, mu_DENT2_g0_pois[i,]))
  mmu_DENT2_g1_pois[i] <- mean(rpois(L, mu_DENT2_g1_pois[i,]))
}
mu_SOCWORK1_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_SOCWORK1[,group==0]
mu_SOCWORK1_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_SOCWORK1[,group==1]
mu_SOCWORK2_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_SOCWORK2[,group==0]
mu_SOCWORK2_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_SOCWORK2[,group==1]
mmu_SOCWORK1_g0_pois <- mmu_SOCWORK1_g1_pois <- c()
mmu_SOCWORK2_g0_pois <- mmu_SOCWORK2_g1_pois <- c()
for(i in 1:jagsModel_pois$n.iter){
  mmu_SOCWORK1_g0_pois[i] <- mean(rpois(L, mu_SOCWORK1_g0_pois[i,]))
  mmu_SOCWORK1_g1_pois[i] <- mean(rpois(L, mu_SOCWORK1_g1_pois[i,]))
  mmu_SOCWORK2_g0_pois[i] <- mean(rpois(L, mu_SOCWORK2_g0_pois[i,]))
  mmu_SOCWORK2_g1_pois[i] <- mean(rpois(L, mu_SOCWORK2_g1_pois[i,]))
}
mu_COMWORK1_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_COMWORK1[,group==0]
mu_COMWORK1_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_COMWORK1[,group==1]
mu_COMWORK2_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_COMWORK2[,group==0]
mu_COMWORK2_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_COMWORK2[,group==1]
mmu_COMWORK1_g0_pois <- mmu_COMWORK1_g1_pois <- c()
mmu_COMWORK2_g0_pois <- mmu_COMWORK2_g1_pois <- c()
for(i in 1:jagsModel_pois$n.iter){
  mmu_COMWORK1_g0_pois[i] <- mean(rpois(L, mu_COMWORK1_g0_pois[i,]))
  mmu_COMWORK1_g1_pois[i] <- mean(rpois(L, mu_COMWORK1_g1_pois[i,]))
  mmu_COMWORK2_g0_pois[i] <- mean(rpois(L, mu_COMWORK2_g0_pois[i,]))
  mmu_COMWORK2_g1_pois[i] <- mean(rpois(L, mu_COMWORK2_g1_pois[i,]))
}
mu_GP1_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_GP1[,group==0]
mu_GP1_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_GP1[,group==1]
mu_GP2_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_GP2[,group==0]
mu_GP2_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_GP2[,group==1]
mmu_GP1_g0_pois <- mmu_GP1_g1_pois <- c()
mmu_GP2_g0_pois <- mmu_GP2_g1_pois <- c()
for(i in 1:jagsModel_pois$n.iter){
  mmu_GP1_g0_pois[i] <- mean(rpois(L, mu_GP1_g0_pois[i,]))
  mmu_GP1_g1_pois[i] <- mean(rpois(L, mu_GP1_g1_pois[i,]))
  mmu_GP2_g0_pois[i] <- mean(rpois(L, mu_GP2_g0_pois[i,]))
  mmu_GP2_g1_pois[i] <- mean(rpois(L, mu_GP2_g1_pois[i,]))
}
mu_NURSE1_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_NURSE1[,group==0]
mu_NURSE1_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_NURSE1[,group==1]
mu_NURSE2_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_NURSE2[,group==0]
mu_NURSE2_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_NURSE2[,group==1]
mmu_NURSE1_g0_pois <- mmu_NURSE1_g1_pois <- c()
mmu_NURSE2_g0_pois <- mmu_NURSE2_g1_pois <- c()
for(i in 1:jagsModel_pois$n.iter){
  mmu_NURSE1_g0_pois[i] <- mean(rpois(L, mu_NURSE1_g0_pois[i,]))
  mmu_NURSE1_g1_pois[i] <- mean(rpois(L, mu_NURSE1_g1_pois[i,]))
  mmu_NURSE2_g0_pois[i] <- mean(rpois(L, mu_NURSE2_g0_pois[i,]))
  mmu_NURSE2_g1_pois[i] <- mean(rpois(L, mu_NURSE2_g1_pois[i,]))
}
mu_THERAP1_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_THERAP1[,group==0]
mu_THERAP1_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_THERAP1[,group==1]
mu_THERAP2_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_THERAP2[,group==0]
mu_THERAP2_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$mu_THERAP2[,group==1]
mmu_THERAP1_g0_pois <- mmu_THERAP1_g1_pois <- c()
mmu_THERAP2_g0_pois <- mmu_THERAP2_g1_pois <- c()
for(i in 1:jagsModel_pois$n.iter){
  mmu_THERAP1_g0_pois[i] <- mean(rpois(L, mu_THERAP1_g0_pois[i,]))
  mmu_THERAP1_g1_pois[i] <- mean(rpois(L, mu_THERAP1_g1_pois[i,]))
  mmu_THERAP2_g0_pois[i] <- mean(rpois(L, mu_THERAP2_g0_pois[i,]))
  mmu_THERAP2_g1_pois[i] <- mean(rpois(L, mu_THERAP2_g1_pois[i,]))
}


set.seed(8361299)
mu_PSYDR1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PSYDR1[,group==0]
mu_PSYDR1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PSYDR1[,group==1]
mu_PSYDR2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PSYDR2[,group==0]
mu_PSYDR2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PSYDR2[,group==1]
r_PSYDR1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PSYDR1[,1]
r_PSYDR1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PSYDR1[,1]
r_PSYDR2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PSYDR2[,1]
r_PSYDR2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PSYDR2[,1]
mmu_PSYDR1_g0_nbinom <- mmu_PSYDR1_g1_nbinom <- c()
mmu_PSYDR2_g0_nbinom <- mmu_PSYDR2_g1_nbinom <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  mmu_PSYDR1_g0_nbinom[i] <- mean(rnegbin(L, mu=mu_PSYDR1_g0_nbinom[i,], theta=r_PSYDR1_g0_nbinom[i]))
  mmu_PSYDR1_g1_nbinom[i] <- mean(rnegbin(L, mu=mu_PSYDR1_g1_nbinom[i,], theta=r_PSYDR1_g1_nbinom[i]))
  mmu_PSYDR2_g0_nbinom[i] <- mean(rnegbin(L, mu=mu_PSYDR2_g0_nbinom[i,], theta=r_PSYDR2_g0_nbinom[i]))
  mmu_PSYDR2_g1_nbinom[i] <- mean(rnegbin(L, mu=mu_PSYDR2_g1_nbinom[i,], theta=r_PSYDR2_g1_nbinom[i]))
}
mu_PSYCH1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PSYCH1[,group==0]
mu_PSYCH1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PSYCH1[,group==1]
mu_PSYCH2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PSYCH2[,group==0]
mu_PSYCH2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PSYCH2[,group==1]
r_PSYCH1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PSYCH1[,1]
r_PSYCH1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PSYCH1[,1]
r_PSYCH2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PSYCH2[,1]
r_PSYCH2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PSYCH2[,1]
mmu_PSYCH1_g0_nbinom <- mmu_PSYCH1_g1_nbinom <- c()
mmu_PSYCH2_g0_nbinom <- mmu_PSYCH2_g1_nbinom <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  mmu_PSYCH1_g0_nbinom[i] <- mean(rnegbin(L, mu=mu_PSYCH1_g0_nbinom[i,], theta=r_PSYCH1_g0_nbinom[i]))
  mmu_PSYCH1_g1_nbinom[i] <- mean(rnegbin(L, mu=mu_PSYCH1_g1_nbinom[i,], theta=r_PSYCH1_g1_nbinom[i]))
  mmu_PSYCH2_g0_nbinom[i] <- mean(rnegbin(L, mu=mu_PSYCH2_g0_nbinom[i,], theta=r_PSYCH2_g0_nbinom[i]))
  mmu_PSYCH2_g1_nbinom[i] <- mean(rnegbin(L, mu=mu_PSYCH2_g1_nbinom[i,], theta=r_PSYCH2_g1_nbinom[i]))
}
mu_PHYSI1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PHYSI1[,group==0]
mu_PHYSI1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PHYSI1[,group==1]
mu_PHYSI2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PHYSI2[,group==0]
mu_PHYSI2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_PHYSI2[,group==1]
r_PHYSI1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PHYSI1[,1]
r_PHYSI1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PHYSI1[,1]
r_PHYSI2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PHYSI2[,1]
r_PHYSI2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_PHYSI2[,1]
mmu_PHYSI1_g0_nbinom <- mmu_PHYSI1_g1_nbinom <- c()
mmu_PHYSI2_g0_nbinom <- mmu_PHYSI2_g1_nbinom <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  mmu_PHYSI1_g0_nbinom[i] <- mean(rnegbin(L, mu=mu_PHYSI1_g0_nbinom[i,], theta=r_PHYSI1_g0_nbinom[i]))
  mmu_PHYSI1_g1_nbinom[i] <- mean(rnegbin(L, mu=mu_PHYSI1_g1_nbinom[i,], theta=r_PHYSI1_g1_nbinom[i]))
  mmu_PHYSI2_g0_nbinom[i] <- mean(rnegbin(L, mu=mu_PHYSI2_g0_nbinom[i,], theta=r_PHYSI2_g0_nbinom[i]))
  mmu_PHYSI2_g1_nbinom[i] <- mean(rnegbin(L, mu=mu_PHYSI2_g1_nbinom[i,], theta=r_PHYSI2_g1_nbinom[i]))
}
mu_DENT1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_DENT1[,group==0]
mu_DENT1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_DENT1[,group==1]
mu_DENT2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_DENT2[,group==0]
mu_DENT2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_DENT2[,group==1]
r_DENT1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_DENT1[,1]
r_DENT1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_DENT1[,1]
r_DENT2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_DENT2[,1]
r_DENT2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_DENT2[,1]
mmu_DENT1_g0_nbinom <- mmu_DENT1_g1_nbinom <- c()
mmu_DENT2_g0_nbinom <- mmu_DENT2_g1_nbinom <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  mmu_DENT1_g0_nbinom[i] <- mean(rnegbin(L, mu=mu_DENT1_g0_nbinom[i,], theta=r_DENT1_g0_nbinom[i]))
  mmu_DENT1_g1_nbinom[i] <- mean(rnegbin(L, mu=mu_DENT1_g1_nbinom[i,], theta=r_DENT1_g1_nbinom[i]))
  mmu_DENT2_g0_nbinom[i] <- mean(rnegbin(L, mu=mu_DENT2_g0_nbinom[i,], theta=r_DENT2_g0_nbinom[i]))
  mmu_DENT2_g1_nbinom[i] <- mean(rnegbin(L, mu=mu_DENT2_g1_nbinom[i,], theta=r_DENT2_g1_nbinom[i]))
}
mu_SOCWORK1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_SOCWORK1[,group==0]
mu_SOCWORK1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_SOCWORK1[,group==1]
mu_SOCWORK2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_SOCWORK2[,group==0]
mu_SOCWORK2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_SOCWORK2[,group==1]
r_SOCWORK1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_SOCWORK1[,1]
r_SOCWORK1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_SOCWORK1[,1]
r_SOCWORK2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_SOCWORK2[,1]
r_SOCWORK2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_SOCWORK2[,1]
mmu_SOCWORK1_g0_nbinom <- mmu_SOCWORK1_g1_nbinom <- c()
mmu_SOCWORK2_g0_nbinom <- mmu_SOCWORK2_g1_nbinom <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  mmu_SOCWORK1_g0_nbinom[i] <- mean(rnegbin(L, mu=mu_SOCWORK1_g0_nbinom[i,], theta=r_SOCWORK1_g0_nbinom[i]))
  mmu_SOCWORK1_g1_nbinom[i] <- mean(rnegbin(L, mu=mu_SOCWORK1_g1_nbinom[i,], theta=r_SOCWORK1_g1_nbinom[i]))
  mmu_SOCWORK2_g0_nbinom[i] <- mean(rnegbin(L, mu=mu_SOCWORK2_g0_nbinom[i,], theta=r_SOCWORK2_g0_nbinom[i]))
  mmu_SOCWORK2_g1_nbinom[i] <- mean(rnegbin(L, mu=mu_SOCWORK2_g1_nbinom[i,], theta=r_SOCWORK2_g1_nbinom[i]))
}
mu_COMWORK1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_COMWORK1[,group==0]
mu_COMWORK1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_COMWORK1[,group==1]
mu_COMWORK2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_COMWORK2[,group==0]
mu_COMWORK2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_COMWORK2[,group==1]
r_COMWORK1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_COMWORK1[,1]
r_COMWORK1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_COMWORK1[,1]
r_COMWORK2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_COMWORK2[,1]
r_COMWORK2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_COMWORK2[,1]
mmu_COMWORK1_g0_nbinom <- mmu_COMWORK1_g1_nbinom <- c()
mmu_COMWORK2_g0_nbinom <- mmu_COMWORK2_g1_nbinom <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  mmu_COMWORK1_g0_nbinom[i] <- mean(rnegbin(L, mu=mu_COMWORK1_g0_nbinom[i,], theta=r_COMWORK1_g0_nbinom[i]))
  mmu_COMWORK1_g1_nbinom[i] <- mean(rnegbin(L, mu=mu_COMWORK1_g1_nbinom[i,], theta=r_COMWORK1_g1_nbinom[i]))
  mmu_COMWORK2_g0_nbinom[i] <- mean(rnegbin(L, mu=mu_COMWORK2_g0_nbinom[i,], theta=r_COMWORK2_g0_nbinom[i]))
  mmu_COMWORK2_g1_nbinom[i] <- mean(rnegbin(L, mu=mu_COMWORK2_g1_nbinom[i,], theta=r_COMWORK2_g1_nbinom[i]))
}
mu_GP1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_GP1[,group==0]
mu_GP1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_GP1[,group==1]
mu_GP2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_GP2[,group==0]
mu_GP2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_GP2[,group==1]
r_GP1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_GP1
r_GP1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_GP1
r_GP2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_GP2
r_GP2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_GP2
mmu_GP1_g0_nbinom <- mmu_GP1_g1_nbinom <- c()
mmu_GP2_g0_nbinom <- mmu_GP2_g1_nbinom <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  mmu_GP1_g0_nbinom[i] <- mean(rnegbin(L, mu=mu_GP1_g0_nbinom[i,], theta=r_GP1_g0_nbinom[i]))
  mmu_GP1_g1_nbinom[i] <- mean(rnegbin(L, mu=mu_GP1_g1_nbinom[i,], theta=r_GP1_g1_nbinom[i]))
  mmu_GP2_g0_nbinom[i] <- mean(rnegbin(L, mu=mu_GP2_g0_nbinom[i,], theta=r_GP2_g0_nbinom[i]))
  mmu_GP2_g1_nbinom[i] <- mean(rnegbin(L, mu=mu_GP2_g1_nbinom[i,], theta=r_GP2_g1_nbinom[i]))
}
mu_NURSE1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_NURSE1[,group==0]
mu_NURSE1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_NURSE1[,group==1]
mu_NURSE2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_NURSE2[,group==0]
mu_NURSE2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_NURSE2[,group==1]
r_NURSE1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_NURSE1[,1]
r_NURSE1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_NURSE1[,1]
r_NURSE2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_NURSE2[,1]
r_NURSE2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_NURSE2[,1]
mmu_NURSE1_g0_nbinom <- mmu_NURSE1_g1_nbinom <- c()
mmu_NURSE2_g0_nbinom <- mmu_NURSE2_g1_nbinom <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  mmu_NURSE1_g0_nbinom[i] <- mean(rnegbin(L, mu=mu_NURSE1_g0_nbinom[i,], theta=r_NURSE1_g0_nbinom[i]))
  mmu_NURSE1_g1_nbinom[i] <- mean(rnegbin(L, mu=mu_NURSE1_g1_nbinom[i,], theta=r_NURSE1_g1_nbinom[i]))
  mmu_NURSE2_g0_nbinom[i] <- mean(rnegbin(L, mu=mu_NURSE2_g0_nbinom[i,], theta=r_NURSE2_g0_nbinom[i]))
  mmu_NURSE2_g1_nbinom[i] <- mean(rnegbin(L, mu=mu_NURSE2_g1_nbinom[i,], theta=r_NURSE2_g1_nbinom[i]))
}
mu_THERAP1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_THERAP1[,group==0]
mu_THERAP1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_THERAP1[,group==1]
mu_THERAP2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_THERAP2[,group==0]
mu_THERAP2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$mu_THERAP2[,group==1]
r_THERAP1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_THERAP1[,1]
r_THERAP1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_THERAP1[,1]
r_THERAP2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_THERAP2[,1]
r_THERAP2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$r_THERAP2[,1]
mmu_THERAP1_g0_nbinom <- mmu_THERAP1_g1_nbinom <- c()
mmu_THERAP2_g0_nbinom <- mmu_THERAP2_g1_nbinom <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  mmu_THERAP1_g0_nbinom[i] <- mean(rnegbin(L, mu=mu_THERAP1_g0_nbinom[i,], theta=r_THERAP1_g0_nbinom[i]))
  mmu_THERAP1_g1_nbinom[i] <- mean(rnegbin(L, mu=mu_THERAP1_g1_nbinom[i,], theta=r_THERAP1_g1_nbinom[i]))
  mmu_THERAP2_g0_nbinom[i] <- mean(rnegbin(L, mu=mu_THERAP2_g0_nbinom[i,], theta=r_THERAP2_g0_nbinom[i]))
  mmu_THERAP2_g1_nbinom[i] <- mean(rnegbin(L, mu=mu_THERAP2_g1_nbinom[i,], theta=r_THERAP2_g1_nbinom[i]))
}

#generate posterior means by MC (final joint model)
set.seed(8361299)
L <- 10000
#approximate marginal mean outcome per group from each model
mu_eq5d0_g0_norm <- jagsModel_pois_final$BUGSoutput$sims.list$mu_EQ5D0[,group==0]
mu_eq5d0_g1_norm <- jagsModel_pois_final$BUGSoutput$sims.list$mu_EQ5D0[,group==1]
mu_eq5d1_g0_norm <- jagsModel_pois_final$BUGSoutput$sims.list$mu_EQ5D1[,group==0]
mu_eq5d1_g1_norm <- jagsModel_pois_final$BUGSoutput$sims.list$mu_EQ5D1[,group==1]
mu_eq5d2_g0_norm <- jagsModel_pois_final$BUGSoutput$sims.list$mu_EQ5D2[,group==0]
mu_eq5d2_g1_norm <- jagsModel_pois_final$BUGSoutput$sims.list$mu_EQ5D2[,group==1]
sd_eq5d0_g0_norm <- jagsModel_pois_final$BUGSoutput$sims.list$sd_EQ5D0
sd_eq5d0_g1_norm <- jagsModel_pois_final$BUGSoutput$sims.list$sd_EQ5D0
sd_eq5d1_g0_norm <- jagsModel_pois_final$BUGSoutput$sims.list$sd_EQ5D1[,1]
sd_eq5d1_g1_norm <- jagsModel_pois_final$BUGSoutput$sims.list$sd_EQ5D1[,2]
sd_eq5d2_g0_norm <- jagsModel_pois_final$BUGSoutput$sims.list$sd_EQ5D2[,1]
sd_eq5d2_g1_norm <- jagsModel_pois_final$BUGSoutput$sims.list$sd_EQ5D2[,2]
mmu_eq5d0_g0_norm <- mmu_eq5d0_g1_norm <- c()
mmu_eq5d1_g0_norm <- mmu_eq5d1_g1_norm <- c()
mmu_eq5d2_g0_norm <- mmu_eq5d2_g1_norm <- c()
for(i in 1:jagsModel_pois_final$n.iter){
  mmu_eq5d0_g0_norm[i] <- mean(rnorm(L, mu_eq5d0_g0_norm[i,], sd_eq5d0_g0_norm[i]))
  mmu_eq5d0_g1_norm[i] <- mean(rnorm(L, mu_eq5d0_g1_norm[i,], sd_eq5d0_g1_norm[i]))
  mmu_eq5d1_g0_norm[i] <- mean(rnorm(L, mu_eq5d1_g0_norm[i,], sd_eq5d1_g0_norm[i]))
  mmu_eq5d1_g1_norm[i] <- mean(rnorm(L, mu_eq5d1_g1_norm[i,], sd_eq5d1_g1_norm[i]))
  mmu_eq5d2_g0_norm[i] <- mean(rnorm(L, mu_eq5d2_g0_norm[i,], sd_eq5d2_g0_norm[i]))
  mmu_eq5d2_g1_norm[i] <- mean(rnorm(L, mu_eq5d2_g1_norm[i,], sd_eq5d2_g1_norm[i]))
}

#extract proportions of S0s for each model
set.seed(8361299)
psi_S0PSYDR_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$psi_S0PSYDR[,group==0]
psi_S0PSYDR_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$psi_S0PSYDR[,group==1]
prob_PSYDR_g0_norm <- prob_PSYDR_g1_norm <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  prob_PSYDR_g0_norm[i] <- mean(rbinom(L, size = 1, prob=psi_S0PSYDR_g0_norm[i,]))
  prob_PSYDR_g1_norm[i] <- mean(rbinom(L, size = 1, prob=psi_S0PSYDR_g1_norm[i,]))
}
set.seed(8361299)
psi_S0PSYCH_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$psi_S0PSYCH[,group==0]
psi_S0PSYCH_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$psi_S0PSYCH[,group==1]
prob_PSYCH_g0_norm <- prob_PSYCH_g1_norm <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  prob_PSYCH_g0_norm[i] <- mean(rbinom(L, size = 1, prob=psi_S0PSYCH_g0_norm[i,]))
  prob_PSYCH_g1_norm[i] <- mean(rbinom(L, size = 1, prob=psi_S0PSYCH_g1_norm[i,]))
}
set.seed(8361299)
psi_S0PHYSI_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$psi_S0PHYSI[,group==0]
psi_S0PHYSI_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$psi_S0PHYSI[,group==1]
prob_PHYSI_g0_norm <- prob_PHYSI_g1_norm <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  prob_PHYSI_g0_norm[i] <- mean(rbinom(L, size = 1, prob=psi_S0PHYSI_g0_norm[i,]))
  prob_PHYSI_g1_norm[i] <- mean(rbinom(L, size = 1, prob=psi_S0PHYSI_g1_norm[i,]))
}
set.seed(8361299)
psi_S0DENT_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$psi_S0DENT[,group==0]
psi_S0DENT_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$psi_S0DENT[,group==1]
prob_DENT_g0_norm <- prob_DENT_g1_norm <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  prob_DENT_g0_norm[i] <- mean(rbinom(L, size = 1, prob=psi_S0DENT_g0_norm[i,]))
  prob_DENT_g1_norm[i] <- mean(rbinom(L, size = 1, prob=psi_S0DENT_g1_norm[i,]))
}
set.seed(8361299)
psi_S0SOCWORK_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$psi_S0SOCWORK[,group==0]
psi_S0SOCWORK_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$psi_S0SOCWORK[,group==1]
prob_SOCWORK_g0_norm <- prob_SOCWORK_g1_norm <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  prob_SOCWORK_g0_norm[i] <- mean(rbinom(L, size = 1, prob=psi_S0SOCWORK_g0_norm[i,]))
  prob_SOCWORK_g1_norm[i] <- mean(rbinom(L, size = 1, prob=psi_S0SOCWORK_g1_norm[i,]))
}
set.seed(8361299)
psi_S0COMWORK_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$psi_S0COMWORK[,group==0]
psi_S0COMWORK_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$psi_S0COMWORK[,group==1]
prob_COMWORK_g0_norm <- prob_COMWORK_g1_norm <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  prob_COMWORK_g0_norm[i] <- mean(rbinom(L, size = 1, prob=psi_S0COMWORK_g0_norm[i,]))
  prob_COMWORK_g1_norm[i] <- mean(rbinom(L, size = 1, prob=psi_S0COMWORK_g1_norm[i,]))
}
set.seed(8361299)
psi_S0NURSE_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$psi_S0NURSE[,group==0]
psi_S0NURSE_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$psi_S0NURSE[,group==1]
prob_NURSE_g0_norm <- prob_NURSE_g1_norm <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  prob_NURSE_g0_norm[i] <- mean(rbinom(L, size = 1, prob=psi_S0NURSE_g0_norm[i,]))
  prob_NURSE_g1_norm[i] <- mean(rbinom(L, size = 1, prob=psi_S0NURSE_g1_norm[i,]))
}
set.seed(8361299)
psi_S0THERAP_g0_norm <- jagsModel_norm$BUGSoutput$sims.list$psi_S0THERAP[,group==0]
psi_S0THERAP_g1_norm <- jagsModel_norm$BUGSoutput$sims.list$psi_S0THERAP[,group==1]
prob_THERAP_g0_norm <- prob_THERAP_g1_norm <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  prob_THERAP_g0_norm[i] <- mean(rbinom(L, size = 1, prob=psi_S0THERAP_g0_norm[i,]))
  prob_THERAP_g1_norm[i] <- mean(rbinom(L, size = 1, prob=psi_S0THERAP_g1_norm[i,]))
}


set.seed(8361299)
psi_S0PSYDR_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_S0PSYDR[,group==0]
psi_S0PSYDR_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_S0PSYDR[,group==1]
prob_PSYDR_g0_pois <- prob_PSYDR_g1_pois <- c()
for(i in 1:jagsModel_pois$n.iter){
  prob_PSYDR_g0_pois[i] <- mean(rbinom(L, size = 1, prob=psi_S0PSYDR_g0_pois[i,]))
  prob_PSYDR_g1_pois[i] <- mean(rbinom(L, size = 1, prob=psi_S0PSYDR_g1_pois[i,]))
}
set.seed(8361299)
psi_S0PSYCH_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_S0PSYCH[,group==0]
psi_S0PSYCH_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_S0PSYCH[,group==1]
prob_PSYCH_g0_pois <- prob_PSYCH_g1_pois <- c()
for(i in 1:jagsModel_pois$n.iter){
  prob_PSYCH_g0_pois[i] <- mean(rbinom(L, size = 1, prob=psi_S0PSYCH_g0_pois[i,]))
  prob_PSYCH_g1_pois[i] <- mean(rbinom(L, size = 1, prob=psi_S0PSYCH_g1_pois[i,]))
}
set.seed(8361299)
psi_S0PHYSI_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_S0PHYSI[,group==0]
psi_S0PHYSI_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_S0PHYSI[,group==1]
prob_PHYSI_g0_pois <- prob_PHYSI_g1_pois <- c()
for(i in 1:jagsModel_pois$n.iter){
  prob_PHYSI_g0_pois[i] <- mean(rbinom(L, size = 1, prob=psi_S0PHYSI_g0_pois[i,]))
  prob_PHYSI_g1_pois[i] <- mean(rbinom(L, size = 1, prob=psi_S0PHYSI_g1_pois[i,]))
}
set.seed(8361299)
psi_S0DENT_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_S0DENT[,group==0]
psi_S0DENT_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_S0DENT[,group==1]
prob_DENT_g0_pois <- prob_DENT_g1_pois <- c()
for(i in 1:jagsModel_pois$n.iter){
  prob_DENT_g0_pois[i] <- mean(rbinom(L, size = 1, prob=psi_S0DENT_g0_pois[i,]))
  prob_DENT_g1_pois[i] <- mean(rbinom(L, size = 1, prob=psi_S0DENT_g1_pois[i,]))
}
set.seed(8361299)
psi_S0SOCWORK_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_S0SOCWORK[,group==0]
psi_S0SOCWORK_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_S0SOCWORK[,group==1]
prob_SOCWORK_g0_pois <- prob_SOCWORK_g1_pois <- c()
for(i in 1:jagsModel_pois$n.iter){
  prob_SOCWORK_g0_pois[i] <- mean(rbinom(L, size = 1, prob=psi_S0SOCWORK_g0_pois[i,]))
  prob_SOCWORK_g1_pois[i] <- mean(rbinom(L, size = 1, prob=psi_S0SOCWORK_g1_pois[i,]))
}
set.seed(8361299)
psi_S0COMWORK_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_S0COMWORK[,group==0]
psi_S0COMWORK_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_S0COMWORK[,group==1]
prob_COMWORK_g0_pois <- prob_COMWORK_g1_pois <- c()
for(i in 1:jagsModel_pois$n.iter){
  prob_COMWORK_g0_pois[i] <- mean(rbinom(L, size = 1, prob=psi_S0COMWORK_g0_pois[i,]))
  prob_COMWORK_g1_pois[i] <- mean(rbinom(L, size = 1, prob=psi_S0COMWORK_g1_pois[i,]))
}
set.seed(8361299)
psi_non_S0GP0_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_non_S0GP0[,group==0]
psi_non_S0GP0_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_non_S0GP0[,group==1]
psi_non_S0GP1_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_non_S0GP1[,group==0]
psi_non_S0GP1_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_non_S0GP1[,group==1]
psi_non_S0GP2_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_non_S0GP2[,group==0]
psi_non_S0GP2_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_non_S0GP2[,group==1]
prob_GP0_g0_pois <- prob_GP0_g1_pois <- c()
prob_GP1_g0_pois <- prob_GP1_g1_pois <- c()
prob_GP2_g0_pois <- prob_GP2_g1_pois <- c()
for(i in 1:jagsModel_pois$n.iter){
  prob_GP0_g0_pois[i] <- mean(rbinom(L, size = 1, prob=psi_non_S0GP0_g0_pois[i,]))
  prob_GP0_g1_pois[i] <- mean(rbinom(L, size = 1, prob=psi_non_S0GP0_g1_pois[i,]))
  prob_GP1_g0_pois[i] <- mean(rbinom(L, size = 1, prob=psi_non_S0GP1_g0_pois[i,]))
  prob_GP1_g1_pois[i] <- mean(rbinom(L, size = 1, prob=psi_non_S0GP1_g1_pois[i,]))
  prob_GP2_g0_pois[i] <- mean(rbinom(L, size = 1, prob=psi_non_S0GP2_g0_pois[i,]))
  prob_GP2_g1_pois[i] <- mean(rbinom(L, size = 1, prob=psi_non_S0GP2_g1_pois[i,]))
}
set.seed(8361299)
psi_S0NURSE_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_S0NURSE[,group==0]
psi_S0NURSE_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_S0NURSE[,group==1]
prob_NURSE_g0_pois <- prob_NURSE_g1_pois <- c()
for(i in 1:jagsModel_pois$n.iter){
  prob_NURSE_g0_pois[i] <- mean(rbinom(L, size = 1, prob=psi_S0NURSE_g0_pois[i,]))
  prob_NURSE_g1_pois[i] <- mean(rbinom(L, size = 1, prob=psi_S0NURSE_g1_pois[i,]))
}
set.seed(8361299)
psi_S0THERAP_g0_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_S0THERAP[,group==0]
psi_S0THERAP_g1_pois <- jagsModel_pois$BUGSoutput$sims.list$psi_S0THERAP[,group==1]
prob_THERAP_g0_pois <- prob_THERAP_g1_pois <- c()
for(i in 1:jagsModel_pois$n.iter){
  prob_THERAP_g0_pois[i] <- mean(rbinom(L, size = 1, prob=psi_S0THERAP_g0_pois[i,]))
  prob_THERAP_g1_pois[i] <- mean(rbinom(L, size = 1, prob=psi_S0THERAP_g1_pois[i,]))
}


set.seed(8361299)
psi_S0PSYDR_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_S0PSYDR[,group==0]
psi_S0PSYDR_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_S0PSYDR[,group==1]
prob_PSYDR_g0_nbinom <- prob_PSYDR_g1_nbinom <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  prob_PSYDR_g0_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_S0PSYDR_g0_nbinom[i,]))
  prob_PSYDR_g1_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_S0PSYDR_g1_nbinom[i,]))
}
set.seed(8361299)
psi_S0PSYCH_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_S0PSYCH[,group==0]
psi_S0PSYCH_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_S0PSYCH[,group==1]
prob_PSYCH_g0_nbinom <- prob_PSYCH_g1_nbinom <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  prob_PSYCH_g0_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_S0PSYCH_g0_nbinom[i,]))
  prob_PSYCH_g1_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_S0PSYCH_g1_nbinom[i,]))
}
set.seed(8361299)
psi_S0PHYSI_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_S0PHYSI[,group==0]
psi_S0PHYSI_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_S0PHYSI[,group==1]
prob_PHYSI_g0_nbinom <- prob_PHYSI_g1_nbinom <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  prob_PHYSI_g0_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_S0PHYSI_g0_nbinom[i,]))
  prob_PHYSI_g1_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_S0PHYSI_g1_nbinom[i,]))
}
set.seed(8361299)
psi_S0DENT_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_S0DENT[,group==0]
psi_S0DENT_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_S0DENT[,group==1]
prob_DENT_g0_nbinom <- prob_DENT_g1_nbinom <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  prob_DENT_g0_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_S0DENT_g0_nbinom[i,]))
  prob_DENT_g1_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_S0DENT_g1_nbinom[i,]))
}
set.seed(8361299)
psi_S0SOCWORK_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_S0SOCWORK[,group==0]
psi_S0SOCWORK_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_S0SOCWORK[,group==1]
prob_SOCWORK_g0_nbinom <- prob_SOCWORK_g1_nbinom <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  prob_SOCWORK_g0_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_S0SOCWORK_g0_nbinom[i,]))
  prob_SOCWORK_g1_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_S0SOCWORK_g1_nbinom[i,]))
}
set.seed(8361299)
psi_S0COMWORK_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_S0COMWORK[,group==0]
psi_S0COMWORK_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_S0COMWORK[,group==1]
prob_COMWORK_g0_nbinom <- prob_COMWORK_g1_nbinom <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  prob_COMWORK_g0_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_S0COMWORK_g0_nbinom[i,]))
  prob_COMWORK_g1_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_S0COMWORK_g1_nbinom[i,]))
}
set.seed(8361299)
psi_non_S0GP0_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_non_S0GP0[,group==0]
psi_non_S0GP0_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_non_S0GP0[,group==1]
psi_non_S0GP1_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_non_S0GP1[,group==0]
psi_non_S0GP1_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_non_S0GP1[,group==1]
psi_non_S0GP2_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_non_S0GP2[,group==0]
psi_non_S0GP2_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_non_S0GP2[,group==1]
prob_GP0_g0_nbinom <- prob_GP0_g1_nbinom <- c()
prob_GP1_g0_nbinom <- prob_GP1_g1_nbinom <- c()
prob_GP2_g0_nbinom <- prob_GP2_g1_nbinom <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  prob_GP0_g0_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_non_S0GP0_g0_nbinom[i,]))
  prob_GP0_g1_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_non_S0GP0_g1_nbinom[i,]))
  prob_GP1_g0_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_non_S0GP1_g0_nbinom[i,]))
  prob_GP1_g1_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_non_S0GP1_g1_nbinom[i,]))
  prob_GP2_g0_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_non_S0GP2_g0_nbinom[i,]))
  prob_GP2_g1_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_non_S0GP2_g1_nbinom[i,]))
}
set.seed(8361299)
psi_S0NURSE_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_S0NURSE[,group==0]
psi_S0NURSE_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_S0NURSE[,group==1]
prob_NURSE_g0_nbinom <- prob_NURSE_g1_nbinom <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  prob_NURSE_g0_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_S0NURSE_g0_nbinom[i,]))
  prob_NURSE_g1_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_S0NURSE_g1_nbinom[i,]))
}
set.seed(8361299)
psi_S0THERAP_g0_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_S0THERAP[,group==0]
psi_S0THERAP_g1_nbinom <- jagsModel_nbinom$BUGSoutput$sims.list$psi_S0THERAP[,group==1]
prob_THERAP_g0_nbinom <- prob_THERAP_g1_nbinom <- c()
for(i in 1:jagsModel_nbinom$n.iter){
  prob_THERAP_g0_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_S0THERAP_g0_nbinom[i,]))
  prob_THERAP_g1_nbinom[i] <- mean(rbinom(L, size = 1, prob=psi_S0THERAP_g1_nbinom[i,]))
}


#get mean results for HRU means weighted for S0 proportion
wmmu_PSYDR1_g0_norm <- mmu_PSYDR1_g0_norm*(1-prob_PSYDR_g0_norm)
wmmu_PSYDR2_g0_norm <- mmu_PSYDR2_g0_norm*(1-prob_PSYDR_g0_norm)
wmmu_PSYDR1_g1_norm <- mmu_PSYDR1_g1_norm*(1-prob_PSYDR_g1_norm)
wmmu_PSYDR2_g1_norm <- mmu_PSYDR2_g1_norm*(1-prob_PSYDR_g1_norm)
wmmu_PSYCH1_g0_norm <- mmu_PSYCH1_g0_norm*(1-prob_PSYCH_g0_norm)
wmmu_PSYCH2_g0_norm <- mmu_PSYCH2_g0_norm*(1-prob_PSYCH_g0_norm)
wmmu_PSYCH1_g1_norm <- mmu_PSYCH1_g1_norm*(1-prob_PSYCH_g1_norm)
wmmu_PSYCH2_g1_norm <- mmu_PSYCH2_g1_norm*(1-prob_PSYCH_g1_norm)
wmmu_PHYSI1_g0_norm <- mmu_PHYSI1_g0_norm*(1-prob_PHYSI_g0_norm)
wmmu_PHYSI2_g0_norm <- mmu_PHYSI2_g0_norm*(1-prob_PHYSI_g0_norm)
wmmu_PHYSI1_g1_norm <- mmu_PHYSI1_g1_norm*(1-prob_PHYSI_g1_norm)
wmmu_PHYSI2_g1_norm <- mmu_PHYSI2_g1_norm*(1-prob_PHYSI_g1_norm)
wmmu_DENT1_g0_norm <- mmu_DENT1_g0_norm*(1-prob_DENT_g0_norm)
wmmu_DENT2_g0_norm <- mmu_DENT2_g0_norm*(1-prob_DENT_g0_norm)
wmmu_DENT1_g1_norm <- mmu_DENT1_g1_norm*(1-prob_DENT_g1_norm)
wmmu_DENT2_g1_norm <- mmu_DENT2_g1_norm*(1-prob_DENT_g1_norm)
wmmu_SOCWORK1_g0_norm <- mmu_SOCWORK1_g0_norm*(1-prob_SOCWORK_g0_norm)
wmmu_SOCWORK2_g0_norm <- mmu_SOCWORK2_g0_norm*(1-prob_SOCWORK_g0_norm)
wmmu_SOCWORK1_g1_norm <- mmu_SOCWORK1_g1_norm*(1-prob_SOCWORK_g1_norm)
wmmu_SOCWORK2_g1_norm <- mmu_SOCWORK2_g1_norm*(1-prob_SOCWORK_g1_norm)
wmmu_COMWORK1_g0_norm <- mmu_COMWORK1_g0_norm*(1-prob_COMWORK_g0_norm)
wmmu_COMWORK2_g0_norm <- mmu_COMWORK2_g0_norm*(1-prob_COMWORK_g0_norm)
wmmu_COMWORK1_g1_norm <- mmu_COMWORK1_g1_norm*(1-prob_COMWORK_g1_norm)
wmmu_COMWORK2_g1_norm <- mmu_COMWORK2_g1_norm*(1-prob_COMWORK_g1_norm)
wmmu_GP1_g0_norm <- mmu_GP1_g0_norm
wmmu_GP2_g0_norm <- mmu_GP2_g0_norm
wmmu_GP1_g1_norm <- mmu_GP1_g1_norm
wmmu_GP2_g1_norm <- mmu_GP2_g1_norm
wmmu_NURSE1_g0_norm <- mmu_NURSE1_g0_norm*(1-prob_NURSE_g0_norm)
wmmu_NURSE2_g0_norm <- mmu_NURSE2_g0_norm*(1-prob_NURSE_g0_norm)
wmmu_NURSE1_g1_norm <- mmu_NURSE1_g1_norm*(1-prob_NURSE_g1_norm)
wmmu_NURSE2_g1_norm <- mmu_NURSE2_g1_norm*(1-prob_NURSE_g1_norm)
wmmu_THERAP1_g0_norm <- mmu_THERAP1_g0_norm*(1-prob_THERAP_g0_norm)
wmmu_THERAP2_g0_norm <- mmu_THERAP2_g0_norm*(1-prob_THERAP_g0_norm)
wmmu_THERAP1_g1_norm <- mmu_THERAP1_g1_norm*(1-prob_THERAP_g1_norm)
wmmu_THERAP2_g1_norm <- mmu_THERAP2_g1_norm*(1-prob_THERAP_g1_norm)


wmmu_PSYDR1_g0_pois <- mmu_PSYDR1_g0_pois*(1-prob_PSYDR_g0_pois)
wmmu_PSYDR2_g0_pois <- mmu_PSYDR2_g0_pois*(1-prob_PSYDR_g0_pois)
wmmu_PSYDR1_g1_pois <- mmu_PSYDR1_g1_pois*(1-prob_PSYDR_g1_pois)
wmmu_PSYDR2_g1_pois <- mmu_PSYDR2_g1_pois*(1-prob_PSYDR_g1_pois)
wmmu_PSYCH1_g0_pois <- mmu_PSYCH1_g0_pois*(1-prob_PSYCH_g0_pois)
wmmu_PSYCH2_g0_pois <- mmu_PSYCH2_g0_pois*(1-prob_PSYCH_g0_pois)
wmmu_PSYCH1_g1_pois <- mmu_PSYCH1_g1_pois*(1-prob_PSYCH_g1_pois)
wmmu_PSYCH2_g1_pois <- mmu_PSYCH2_g1_pois*(1-prob_PSYCH_g1_pois)
wmmu_PHYSI1_g0_pois <- mmu_PHYSI1_g0_pois*(1-prob_PHYSI_g0_pois)
wmmu_PHYSI2_g0_pois <- mmu_PHYSI2_g0_pois*(1-prob_PHYSI_g0_pois)
wmmu_PHYSI1_g1_pois <- mmu_PHYSI1_g1_pois*(1-prob_PHYSI_g1_pois)
wmmu_PHYSI2_g1_pois <- mmu_PHYSI2_g1_pois*(1-prob_PHYSI_g1_pois)
wmmu_DENT1_g0_pois <- mmu_DENT1_g0_pois*(1-prob_DENT_g0_pois)
wmmu_DENT2_g0_pois <- mmu_DENT2_g0_pois*(1-prob_DENT_g0_pois)
wmmu_DENT1_g1_pois <- mmu_DENT1_g1_pois*(1-prob_DENT_g1_pois)
wmmu_DENT2_g1_pois <- mmu_DENT2_g1_pois*(1-prob_DENT_g1_pois)
wmmu_SOCWORK1_g0_pois <- mmu_SOCWORK1_g0_pois*(1-prob_SOCWORK_g0_pois)
wmmu_SOCWORK2_g0_pois <- mmu_SOCWORK2_g0_pois*(1-prob_SOCWORK_g0_pois)
wmmu_SOCWORK1_g1_pois <- mmu_SOCWORK1_g1_pois*(1-prob_SOCWORK_g1_pois)
wmmu_SOCWORK2_g1_pois <- mmu_SOCWORK2_g1_pois*(1-prob_SOCWORK_g1_pois)
wmmu_COMWORK1_g0_pois <- mmu_COMWORK1_g0_pois*(1-prob_COMWORK_g0_pois)
wmmu_COMWORK2_g0_pois <- mmu_COMWORK2_g0_pois*(1-prob_COMWORK_g0_pois)
wmmu_COMWORK1_g1_pois <- mmu_COMWORK1_g1_pois*(1-prob_COMWORK_g1_pois)
wmmu_COMWORK2_g1_pois <- mmu_COMWORK2_g1_pois*(1-prob_COMWORK_g1_pois)
wmmu_GP1_g0_pois <- mmu_GP1_g0_pois*(1-prob_GP1_g0_pois)
wmmu_GP2_g0_pois <- mmu_GP2_g0_pois*(1-prob_GP2_g0_pois)
wmmu_GP1_g1_pois <- mmu_GP1_g1_pois*(1-prob_GP1_g1_pois)
wmmu_GP2_g1_pois <- mmu_GP2_g1_pois*(1-prob_GP2_g1_pois)
wmmu_NURSE1_g0_pois <- mmu_NURSE1_g0_pois*(1-prob_NURSE_g0_pois)
wmmu_NURSE2_g0_pois <- mmu_NURSE2_g0_pois*(1-prob_NURSE_g0_pois)
wmmu_NURSE1_g1_pois <- mmu_NURSE1_g1_pois*(1-prob_NURSE_g1_pois)
wmmu_NURSE2_g1_pois <- mmu_NURSE2_g1_pois*(1-prob_NURSE_g1_pois)
wmmu_THERAP1_g0_pois <- mmu_THERAP1_g0_pois*(1-prob_THERAP_g0_pois)
wmmu_THERAP2_g0_pois <- mmu_THERAP2_g0_pois*(1-prob_THERAP_g0_pois)
wmmu_THERAP1_g1_pois <- mmu_THERAP1_g1_pois*(1-prob_THERAP_g1_pois)
wmmu_THERAP2_g1_pois <- mmu_THERAP2_g1_pois*(1-prob_THERAP_g1_pois)


wmmu_PSYDR1_g0_nbinom <- mmu_PSYDR1_g0_nbinom*(1-prob_PSYDR_g0_nbinom)
wmmu_PSYDR2_g0_nbinom <- mmu_PSYDR2_g0_nbinom*(1-prob_PSYDR_g0_nbinom)
wmmu_PSYDR1_g1_nbinom <- mmu_PSYDR1_g1_nbinom*(1-prob_PSYDR_g1_nbinom)
wmmu_PSYDR2_g1_nbinom <- mmu_PSYDR2_g1_nbinom*(1-prob_PSYDR_g1_nbinom)
wmmu_PSYCH1_g0_nbinom <- mmu_PSYCH1_g0_nbinom*(1-prob_PSYCH_g0_nbinom)
wmmu_PSYCH2_g0_nbinom <- mmu_PSYCH2_g0_nbinom*(1-prob_PSYCH_g0_nbinom)
wmmu_PSYCH1_g1_nbinom <- mmu_PSYCH1_g1_nbinom*(1-prob_PSYCH_g1_nbinom)
wmmu_PSYCH2_g1_nbinom <- mmu_PSYCH2_g1_nbinom*(1-prob_PSYCH_g1_nbinom)
wmmu_PHYSI1_g0_nbinom <- mmu_PHYSI1_g0_nbinom*(1-prob_PHYSI_g0_nbinom)
wmmu_PHYSI2_g0_nbinom <- mmu_PHYSI2_g0_nbinom*(1-prob_PHYSI_g0_nbinom)
wmmu_PHYSI1_g1_nbinom <- mmu_PHYSI1_g1_nbinom*(1-prob_PHYSI_g1_nbinom)
wmmu_PHYSI2_g1_nbinom <- mmu_PHYSI2_g1_nbinom*(1-prob_PHYSI_g1_nbinom)
wmmu_DENT1_g0_nbinom <- mmu_DENT1_g0_nbinom*(1-prob_DENT_g0_nbinom)
wmmu_DENT2_g0_nbinom <- mmu_DENT2_g0_nbinom*(1-prob_DENT_g0_nbinom)
wmmu_DENT1_g1_nbinom <- mmu_DENT1_g1_nbinom*(1-prob_DENT_g1_nbinom)
wmmu_DENT2_g1_nbinom <- mmu_DENT2_g1_nbinom*(1-prob_DENT_g1_nbinom)
wmmu_SOCWORK1_g0_nbinom <- mmu_SOCWORK1_g0_nbinom*(1-prob_SOCWORK_g0_nbinom)
wmmu_SOCWORK2_g0_nbinom <- mmu_SOCWORK2_g0_nbinom*(1-prob_SOCWORK_g0_nbinom)
wmmu_SOCWORK1_g1_nbinom <- mmu_SOCWORK1_g1_nbinom*(1-prob_SOCWORK_g1_nbinom)
wmmu_SOCWORK2_g1_nbinom <- mmu_SOCWORK2_g1_nbinom*(1-prob_SOCWORK_g1_nbinom)
wmmu_COMWORK1_g0_nbinom <- mmu_COMWORK1_g0_nbinom*(1-prob_COMWORK_g0_nbinom)
wmmu_COMWORK2_g0_nbinom <- mmu_COMWORK2_g0_nbinom*(1-prob_COMWORK_g0_nbinom)
wmmu_COMWORK1_g1_nbinom <- mmu_COMWORK1_g1_nbinom*(1-prob_COMWORK_g1_nbinom)
wmmu_COMWORK2_g1_nbinom <- mmu_COMWORK2_g1_nbinom*(1-prob_COMWORK_g1_nbinom)
wmmu_GP1_g0_nbinom <- mmu_GP1_g0_nbinom*(1-prob_GP1_g0_nbinom)
wmmu_GP2_g0_nbinom <- mmu_GP2_g0_nbinom*(1-prob_GP2_g0_nbinom)
wmmu_GP1_g1_nbinom <- mmu_GP1_g1_nbinom*(1-prob_GP1_g1_nbinom)
wmmu_GP2_g1_nbinom <- mmu_GP2_g1_nbinom*(1-prob_GP2_g1_nbinom)
wmmu_NURSE1_g0_nbinom <- mmu_NURSE1_g0_nbinom*(1-prob_NURSE_g0_nbinom)
wmmu_NURSE2_g0_nbinom <- mmu_NURSE2_g0_nbinom*(1-prob_NURSE_g0_nbinom)
wmmu_NURSE1_g1_nbinom <- mmu_NURSE1_g1_nbinom*(1-prob_NURSE_g1_nbinom)
wmmu_NURSE2_g1_nbinom <- mmu_NURSE2_g1_nbinom*(1-prob_NURSE_g1_nbinom)
wmmu_THERAP1_g0_nbinom <- mmu_THERAP1_g0_nbinom*(1-prob_THERAP_g0_nbinom)
wmmu_THERAP2_g0_nbinom <- mmu_THERAP2_g0_nbinom*(1-prob_THERAP_g0_nbinom)
wmmu_THERAP1_g1_nbinom <- mmu_THERAP1_g1_nbinom*(1-prob_THERAP_g1_nbinom)
wmmu_THERAP2_g1_nbinom <- mmu_THERAP2_g1_nbinom*(1-prob_THERAP_g1_nbinom)


#add up weighted means to obtain means over trial period
wmmu_PSYDR_g0_norm <- wmmu_PSYDR1_g0_norm + wmmu_PSYDR2_g0_norm
wmmu_PSYDR_g1_norm <- wmmu_PSYDR1_g1_norm + wmmu_PSYDR2_g1_norm
wmmu_PSYCH_g0_norm <- wmmu_PSYCH1_g0_norm + wmmu_PSYCH2_g0_norm
wmmu_PSYCH_g1_norm <- wmmu_PSYCH1_g1_norm + wmmu_PSYCH2_g1_norm
wmmu_PHYSI_g0_norm <- wmmu_PHYSI1_g0_norm + wmmu_PHYSI2_g0_norm
wmmu_PHYSI_g1_norm <- wmmu_PHYSI1_g1_norm + wmmu_PHYSI2_g1_norm
wmmu_DENT_g0_norm <- wmmu_DENT1_g0_norm + wmmu_DENT2_g0_norm
wmmu_DENT_g1_norm <- wmmu_DENT1_g1_norm + wmmu_DENT2_g1_norm
wmmu_SOCWORK_g0_norm <- wmmu_SOCWORK1_g0_norm + wmmu_SOCWORK2_g0_norm
wmmu_SOCWORK_g1_norm <- wmmu_SOCWORK1_g1_norm + wmmu_SOCWORK2_g1_norm
wmmu_COMWORK_g0_norm <- wmmu_COMWORK1_g0_norm + wmmu_COMWORK2_g0_norm
wmmu_COMWORK_g1_norm <- wmmu_COMWORK1_g1_norm + wmmu_COMWORK2_g1_norm
wmmu_GP_g0_norm <- wmmu_GP1_g0_norm + wmmu_GP2_g0_norm
wmmu_GP_g1_norm <- wmmu_GP1_g1_norm + wmmu_GP2_g1_norm
wmmu_NURSE_g0_norm <- wmmu_NURSE1_g0_norm + wmmu_NURSE2_g0_norm
wmmu_NURSE_g1_norm <- wmmu_NURSE1_g1_norm + wmmu_NURSE2_g1_norm
wmmu_THERAP_g0_norm <- wmmu_THERAP1_g0_norm + wmmu_THERAP2_g0_norm
wmmu_THERAP_g1_norm <- wmmu_THERAP1_g1_norm + wmmu_THERAP2_g1_norm
wmmu_PSYDR_g0_pois <- wmmu_PSYDR1_g0_pois + wmmu_PSYDR2_g0_pois
wmmu_PSYDR_g1_pois <- wmmu_PSYDR1_g1_pois + wmmu_PSYDR2_g1_pois
wmmu_PSYCH_g0_pois <- wmmu_PSYCH1_g0_pois + wmmu_PSYCH2_g0_pois
wmmu_PSYCH_g1_pois <- wmmu_PSYCH1_g1_pois + wmmu_PSYCH2_g1_pois
wmmu_PHYSI_g0_pois <- wmmu_PHYSI1_g0_pois + wmmu_PHYSI2_g0_pois
wmmu_PHYSI_g1_pois <- wmmu_PHYSI1_g1_pois + wmmu_PHYSI2_g1_pois
wmmu_DENT_g0_pois <- wmmu_DENT1_g0_pois + wmmu_DENT2_g0_pois
wmmu_DENT_g1_pois <- wmmu_DENT1_g1_pois + wmmu_DENT2_g1_pois
wmmu_SOCWORK_g0_pois <- wmmu_SOCWORK1_g0_pois + wmmu_SOCWORK2_g0_pois
wmmu_SOCWORK_g1_pois <- wmmu_SOCWORK1_g1_pois + wmmu_SOCWORK2_g1_pois
wmmu_COMWORK_g0_pois <- wmmu_COMWORK1_g0_pois + wmmu_COMWORK2_g0_pois
wmmu_COMWORK_g1_pois <- wmmu_COMWORK1_g1_pois + wmmu_COMWORK2_g1_pois
wmmu_GP_g0_pois <- wmmu_GP1_g0_pois + wmmu_GP2_g0_pois
wmmu_GP_g1_pois <- wmmu_GP1_g1_pois + wmmu_GP2_g1_pois
wmmu_NURSE_g0_pois <- wmmu_NURSE1_g0_pois + wmmu_NURSE2_g0_pois
wmmu_NURSE_g1_pois <- wmmu_NURSE1_g1_pois + wmmu_NURSE2_g1_pois
wmmu_THERAP_g0_pois <- wmmu_THERAP1_g0_pois + wmmu_THERAP2_g0_pois
wmmu_THERAP_g1_pois <- wmmu_THERAP1_g1_pois + wmmu_THERAP2_g1_pois
wmmu_PSYDR_g0_nbinom <- wmmu_PSYDR1_g0_nbinom + wmmu_PSYDR2_g0_nbinom
wmmu_PSYDR_g1_nbinom <- wmmu_PSYDR1_g1_nbinom + wmmu_PSYDR2_g1_nbinom
wmmu_PSYCH_g0_nbinom <- wmmu_PSYCH1_g0_nbinom + wmmu_PSYCH2_g0_nbinom
wmmu_PSYCH_g1_nbinom <- wmmu_PSYCH1_g1_nbinom + wmmu_PSYCH2_g1_nbinom
wmmu_PHYSI_g0_nbinom <- wmmu_PHYSI1_g0_nbinom + wmmu_PHYSI2_g0_nbinom
wmmu_PHYSI_g1_nbinom <- wmmu_PHYSI1_g1_nbinom + wmmu_PHYSI2_g1_nbinom
wmmu_DENT_g0_nbinom <- wmmu_DENT1_g0_nbinom + wmmu_DENT2_g0_nbinom
wmmu_DENT_g1_nbinom <- wmmu_DENT1_g1_nbinom + wmmu_DENT2_g1_nbinom
wmmu_SOCWORK_g0_nbinom <- wmmu_SOCWORK1_g0_nbinom + wmmu_SOCWORK2_g0_nbinom
wmmu_SOCWORK_g1_nbinom <- wmmu_SOCWORK1_g1_nbinom + wmmu_SOCWORK2_g1_nbinom
wmmu_COMWORK_g0_nbinom <- wmmu_COMWORK1_g0_nbinom + wmmu_COMWORK2_g0_nbinom
wmmu_COMWORK_g1_nbinom <- wmmu_COMWORK1_g1_nbinom + wmmu_COMWORK2_g1_nbinom
wmmu_GP_g0_nbinom <- wmmu_GP1_g0_nbinom + wmmu_GP2_g0_nbinom
wmmu_GP_g1_nbinom <- wmmu_GP1_g1_nbinom + wmmu_GP2_g1_nbinom
wmmu_NURSE_g0_nbinom <- wmmu_NURSE1_g0_nbinom + wmmu_NURSE2_g0_nbinom
wmmu_NURSE_g1_nbinom <- wmmu_NURSE1_g1_nbinom + wmmu_NURSE2_g1_nbinom
wmmu_THERAP_g0_nbinom <- wmmu_THERAP1_g0_nbinom + wmmu_THERAP2_g0_nbinom
wmmu_THERAP_g1_nbinom <- wmmu_THERAP1_g1_nbinom + wmmu_THERAP2_g1_nbinom

mmu_qaly_g0_norm <- (mmu_eq5d0_g0_norm+mmu_eq5d1_g0_norm)*0.5/2 + (mmu_eq5d1_g0_norm+mmu_eq5d2_g0_norm)*0.5/2
mmu_qaly_g1_norm <- (mmu_eq5d0_g1_norm+mmu_eq5d1_g1_norm)*0.5/2 + (mmu_eq5d1_g1_norm+mmu_eq5d2_g1_norm)*0.5/2

#final joint model
library(HDInterval)
hist(mmu_qaly_g0_norm)
summary(mmu_qaly_g0_norm)
hist(mmu_qaly_g1_norm)
summary(mmu_qaly_g1_norm)
delta_qaly_norm <- mmu_qaly_g1_norm - mmu_qaly_g0_norm
hist(delta_qaly_norm)
summary(delta_qaly_norm)
c(mean(delta_qaly_norm),hdi(delta_qaly_norm, credMass = 0.95))

#store results
res_s2_method1_norm <- list("jagsModel_norm"=jagsModel_norm,
                       "ic_waic_norm_PSYDR"=ic_waic_norm_PSYDR, "ic_looic_norm_PSYDR"=ic_waic_norm_PSYDR,
                       "PSYDR1_g0_obs"=PSYDR1_g0_obs, "PSYDR1_g1_obs"=PSYDR1_g1_obs, "PSYDR2_g0_obs"=PSYDR2_g0_obs,"PSYDR2_g1_obs"=PSYDR2_g1_obs,
                       "PSYDR1_obs_g0_rep_norm"=PSYDR1_obs_g0_rep_norm, "PSYDR1_obs_g1_rep_norm"=PSYDR1_obs_g1_rep_norm,
                       "PSYDR2_obs_g0_rep_norm"=PSYDR2_obs_g0_rep_norm, "PSYDR2_obs_g1_rep_norm"=PSYDR2_obs_g1_rep_norm,
                       "mmu_PSYDR1_g0_norm"=mmu_PSYDR1_g0_norm,"mmu_PSYDR1_g1_norm"=mmu_PSYDR1_g1_norm,
                       "mmu_PSYDR2_g0_norm"=mmu_PSYDR2_g0_norm, "mmu_PSYDR2_g1_norm"=mmu_PSYDR2_g1_norm,
                       "ic_waic_norm_PSYCH"=ic_waic_norm_PSYCH, "ic_looic_norm_PSYCH"=ic_waic_norm_PSYCH,
                       "PSYCH1_g0_obs"=PSYCH1_g0_obs, "PSYCH1_g1_obs"=PSYCH1_g1_obs, "PSYCH2_g0_obs"=PSYCH2_g0_obs,"PSYCH2_g1_obs"=PSYCH2_g1_obs,
                       "PSYCH1_obs_g0_rep_norm"=PSYCH1_obs_g0_rep_norm, "PSYCH1_obs_g1_rep_norm"=PSYCH1_obs_g1_rep_norm,
                       "PSYCH2_obs_g0_rep_norm"=PSYCH2_obs_g0_rep_norm, "PSYCH2_obs_g1_rep_norm"=PSYCH2_obs_g1_rep_norm,
                       "mmu_PSYCH1_g0_norm"=mmu_PSYCH1_g0_norm,"mmu_PSYCH1_g1_norm"=mmu_PSYCH1_g1_norm,
                       "mmu_PSYCH2_g0_norm"=mmu_PSYCH2_g0_norm, "mmu_PSYCH2_g1_norm"=mmu_PSYCH2_g1_norm,
                       "ic_waic_norm_PHYSI"=ic_waic_norm_PHYSI, "ic_looic_norm_PHYSI"=ic_waic_norm_PHYSI,
                       "PHYSI1_g0_obs"=PHYSI1_g0_obs, "PHYSI1_g1_obs"=PHYSI1_g1_obs, "PHYSI2_g0_obs"=PHYSI2_g0_obs,"PHYSI2_g1_obs"=PHYSI2_g1_obs,
                       "PHYSI1_obs_g0_rep_norm"=PHYSI1_obs_g0_rep_norm, "PHYSI1_obs_g1_rep_norm"=PHYSI1_obs_g1_rep_norm,
                       "PHYSI2_obs_g0_rep_norm"=PHYSI2_obs_g0_rep_norm, "PHYSI2_obs_g1_rep_norm"=PHYSI2_obs_g1_rep_norm,
                       "mmu_PHYSI1_g0_norm"=mmu_PHYSI1_g0_norm,"mmu_PHYSI1_g1_norm"=mmu_PHYSI1_g1_norm,
                       "mmu_PHYSI2_g0_norm"=mmu_PHYSI2_g0_norm, "mmu_PHYSI2_g1_norm"=mmu_PHYSI2_g1_norm,
                       "ic_waic_norm_DENT"=ic_waic_norm_DENT, "ic_looic_norm_DENT"=ic_waic_norm_DENT,
                       "DENT1_g0_obs"=DENT1_g0_obs, "DENT1_g1_obs"=DENT1_g1_obs, "DENT2_g0_obs"=DENT2_g0_obs,"DENT2_g1_obs"=DENT2_g1_obs,
                       "DENT1_obs_g0_rep_norm"=DENT1_obs_g0_rep_norm, "DENT1_obs_g1_rep_norm"=DENT1_obs_g1_rep_norm,
                       "DENT2_obs_g0_rep_norm"=DENT2_obs_g0_rep_norm, "DENT2_obs_g1_rep_norm"=DENT2_obs_g1_rep_norm,
                       "mmu_DENT1_g0_norm"=mmu_DENT1_g0_norm,"mmu_DENT1_g1_norm"=mmu_DENT1_g1_norm,
                       "mmu_DENT2_g0_norm"=mmu_DENT2_g0_norm, "mmu_DENT2_g1_norm"=mmu_DENT2_g1_norm,
                       "ic_waic_norm_SOCWORK"=ic_waic_norm_SOCWORK, "ic_looic_norm_SOCWORK"=ic_waic_norm_SOCWORK,
                       "SOCWORK1_g0_obs"=SOCWORK1_g0_obs, "SOCWORK1_g1_obs"=SOCWORK1_g1_obs, "SOCWORK2_g0_obs"=SOCWORK2_g0_obs,"SOCWORK2_g1_obs"=SOCWORK2_g1_obs,
                       "SOCWORK1_obs_g0_rep_norm"=SOCWORK1_obs_g0_rep_norm, "SOCWORK1_obs_g1_rep_norm"=SOCWORK1_obs_g1_rep_norm,
                       "SOCWORK2_obs_g0_rep_norm"=SOCWORK2_obs_g0_rep_norm, "SOCWORK2_obs_g1_rep_norm"=SOCWORK2_obs_g1_rep_norm,
                       "mmu_SOCWORK1_g0_norm"=mmu_SOCWORK1_g0_norm,"mmu_SOCWORK1_g1_norm"=mmu_SOCWORK1_g1_norm,
                       "mmu_SOCWORK2_g0_norm"=mmu_SOCWORK2_g0_norm, "mmu_SOCWORK2_g1_norm"=mmu_SOCWORK2_g1_norm,
                       "ic_waic_norm_COMWORK"=ic_waic_norm_COMWORK, "ic_looic_norm_COMWORK"=ic_waic_norm_COMWORK,
                       "COMWORK1_g0_obs"=COMWORK1_g0_obs, "COMWORK1_g1_obs"=COMWORK1_g1_obs, "COMWORK2_g0_obs"=COMWORK2_g0_obs,"COMWORK2_g1_obs"=COMWORK2_g1_obs,
                       "COMWORK1_obs_g0_rep_norm"=COMWORK1_obs_g0_rep_norm, "COMWORK1_obs_g1_rep_norm"=COMWORK1_obs_g1_rep_norm,
                       "COMWORK2_obs_g0_rep_norm"=COMWORK2_obs_g0_rep_norm, "COMWORK2_obs_g1_rep_norm"=COMWORK2_obs_g1_rep_norm,
                       "mmu_COMWORK1_g0_norm"=mmu_COMWORK1_g0_norm,"mmu_COMWORK1_g1_norm"=mmu_COMWORK1_g1_norm,
                       "mmu_COMWORK2_g0_norm"=mmu_COMWORK2_g0_norm, "mmu_COMWORK2_g1_norm"=mmu_COMWORK2_g1_norm,
                       "ic_waic_norm_GP"=ic_waic_norm_GP, "ic_looic_norm_GP"=ic_waic_norm_GP,
                       "GP1_g0_obs"=GP1_g0_obs, "GP1_g1_obs"=GP1_g1_obs, "GP2_g0_obs"=GP2_g0_obs,"GP2_g1_obs"=GP2_g1_obs,
                       "GP1_obs_g0_rep_norm"=GP1_obs_g0_rep_norm, "GP1_obs_g1_rep_norm"=GP1_obs_g1_rep_norm,
                       "GP2_obs_g0_rep_norm"=GP2_obs_g0_rep_norm, "GP2_obs_g1_rep_norm"=GP2_obs_g1_rep_norm,
                       "mmu_GP1_g0_norm"=mmu_GP1_g0_norm,"mmu_GP1_g1_norm"=mmu_GP1_g1_norm,
                       "mmu_GP2_g0_norm"=mmu_GP2_g0_norm, "mmu_GP2_g1_norm"=mmu_GP2_g1_norm,
                       "ic_waic_norm_NURSE"=ic_waic_norm_NURSE, "ic_looic_norm_NURSE"=ic_waic_norm_NURSE,
                       "NURSE1_g0_obs"=NURSE1_g0_obs, "NURSE1_g1_obs"=NURSE1_g1_obs, "NURSE2_g0_obs"=NURSE2_g0_obs,"NURSE2_g1_obs"=NURSE2_g1_obs,
                       "NURSE1_obs_g0_rep_norm"=NURSE1_obs_g0_rep_norm, "NURSE1_obs_g1_rep_norm"=NURSE1_obs_g1_rep_norm,
                       "NURSE2_obs_g0_rep_norm"=NURSE2_obs_g0_rep_norm, "NURSE2_obs_g1_rep_norm"=NURSE2_obs_g1_rep_norm,
                       "mmu_NURSE1_g0_norm"=mmu_NURSE1_g0_norm,"mmu_NURSE1_g1_norm"=mmu_NURSE1_g1_norm,
                       "mmu_NURSE2_g0_norm"=mmu_NURSE2_g0_norm, "mmu_NURSE2_g1_norm"=mmu_NURSE2_g1_norm,
                       "ic_waic_norm_THERAP"=ic_waic_norm_THERAP, "ic_looic_norm_THERAP"=ic_waic_norm_THERAP,
                       "THERAP1_g0_obs"=THERAP1_g0_obs, "THERAP1_g1_obs"=THERAP1_g1_obs, "THERAP2_g0_obs"=THERAP2_g0_obs,"THERAP2_g1_obs"=THERAP2_g1_obs,
                       "THERAP1_obs_g0_rep_norm"=THERAP1_obs_g0_rep_norm, "THERAP1_obs_g1_rep_norm"=THERAP1_obs_g1_rep_norm,
                       "THERAP2_obs_g0_rep_norm"=THERAP2_obs_g0_rep_norm, "THERAP2_obs_g1_rep_norm"=THERAP2_obs_g1_rep_norm,
                       "mmu_THERAP1_g0_norm"=mmu_THERAP1_g0_norm,"mmu_THERAP1_g1_norm"=mmu_THERAP1_g1_norm,
                       "mmu_THERAP2_g0_norm"=mmu_THERAP2_g0_norm, "mmu_THERAP2_g1_norm"=mmu_THERAP2_g1_norm)


#store results
res_s2_method1_pois <- list("jagsModel_pois"=jagsModel_pois,
                            "ic_waic_pois_PSYDR"=ic_waic_pois_PSYDR, "ic_looic_pois_PSYDR"=ic_waic_pois_PSYDR,
                            "PSYDR1_g0_obs"=PSYDR1_g0_obs, "PSYDR1_g1_obs"=PSYDR1_g1_obs, "PSYDR2_g0_obs"=PSYDR2_g0_obs,"PSYDR2_g1_obs"=PSYDR2_g1_obs,
                            "PSYDR1_obs_g0_rep_pois"=PSYDR1_obs_g0_rep_pois, "PSYDR1_obs_g1_rep_pois"=PSYDR1_obs_g1_rep_pois,
                            "PSYDR2_obs_g0_rep_pois"=PSYDR2_obs_g0_rep_pois, "PSYDR2_obs_g1_rep_pois"=PSYDR2_obs_g1_rep_pois,
                            "mmu_PSYDR1_g0_pois"=mmu_PSYDR1_g0_pois,"mmu_PSYDR1_g1_pois"=mmu_PSYDR1_g1_pois,
                            "mmu_PSYDR2_g0_pois"=mmu_PSYDR2_g0_pois, "mmu_PSYDR2_g1_pois"=mmu_PSYDR2_g1_pois,
                            "ic_waic_pois_PSYCH"=ic_waic_pois_PSYCH, "ic_looic_pois_PSYCH"=ic_waic_pois_PSYCH,
                            "PSYCH1_g0_obs"=PSYCH1_g0_obs, "PSYCH1_g1_obs"=PSYCH1_g1_obs, "PSYCH2_g0_obs"=PSYCH2_g0_obs,"PSYCH2_g1_obs"=PSYCH2_g1_obs,
                            "PSYCH1_obs_g0_rep_pois"=PSYCH1_obs_g0_rep_pois, "PSYCH1_obs_g1_rep_pois"=PSYCH1_obs_g1_rep_pois,
                            "PSYCH2_obs_g0_rep_pois"=PSYCH2_obs_g0_rep_pois, "PSYCH2_obs_g1_rep_pois"=PSYCH2_obs_g1_rep_pois,
                            "mmu_PSYCH1_g0_pois"=mmu_PSYCH1_g0_pois,"mmu_PSYCH1_g1_pois"=mmu_PSYCH1_g1_pois,
                            "mmu_PSYCH2_g0_pois"=mmu_PSYCH2_g0_pois, "mmu_PSYCH2_g1_pois"=mmu_PSYCH2_g1_pois,
                            "ic_waic_pois_PHYSI"=ic_waic_pois_PHYSI, "ic_looic_pois_PHYSI"=ic_waic_pois_PHYSI,
                            "PHYSI1_g0_obs"=PHYSI1_g0_obs, "PHYSI1_g1_obs"=PHYSI1_g1_obs, "PHYSI2_g0_obs"=PHYSI2_g0_obs,"PHYSI2_g1_obs"=PHYSI2_g1_obs,
                            "PHYSI1_obs_g0_rep_pois"=PHYSI1_obs_g0_rep_pois, "PHYSI1_obs_g1_rep_pois"=PHYSI1_obs_g1_rep_pois,
                            "PHYSI2_obs_g0_rep_pois"=PHYSI2_obs_g0_rep_pois, "PHYSI2_obs_g1_rep_pois"=PHYSI2_obs_g1_rep_pois,
                            "mmu_PHYSI1_g0_pois"=mmu_PHYSI1_g0_pois,"mmu_PHYSI1_g1_pois"=mmu_PHYSI1_g1_pois,
                            "mmu_PHYSI2_g0_pois"=mmu_PHYSI2_g0_pois, "mmu_PHYSI2_g1_pois"=mmu_PHYSI2_g1_pois,
                            "ic_waic_pois_DENT"=ic_waic_pois_DENT, "ic_looic_pois_DENT"=ic_waic_pois_DENT,
                            "DENT1_g0_obs"=DENT1_g0_obs, "DENT1_g1_obs"=DENT1_g1_obs, "DENT2_g0_obs"=DENT2_g0_obs,"DENT2_g1_obs"=DENT2_g1_obs,
                            "DENT1_obs_g0_rep_pois"=DENT1_obs_g0_rep_pois, "DENT1_obs_g1_rep_pois"=DENT1_obs_g1_rep_pois,
                            "DENT2_obs_g0_rep_pois"=DENT2_obs_g0_rep_pois, "DENT2_obs_g1_rep_pois"=DENT2_obs_g1_rep_pois,
                            "mmu_DENT1_g0_pois"=mmu_DENT1_g0_pois,"mmu_DENT1_g1_pois"=mmu_DENT1_g1_pois,
                            "mmu_DENT2_g0_pois"=mmu_DENT2_g0_pois, "mmu_DENT2_g1_pois"=mmu_DENT2_g1_pois,
                            "ic_waic_pois_SOCWORK"=ic_waic_pois_SOCWORK, "ic_looic_pois_SOCWORK"=ic_waic_pois_SOCWORK,
                            "SOCWORK1_g0_obs"=SOCWORK1_g0_obs, "SOCWORK1_g1_obs"=SOCWORK1_g1_obs, "SOCWORK2_g0_obs"=SOCWORK2_g0_obs,"SOCWORK2_g1_obs"=SOCWORK2_g1_obs,
                            "SOCWORK1_obs_g0_rep_pois"=SOCWORK1_obs_g0_rep_pois, "SOCWORK1_obs_g1_rep_pois"=SOCWORK1_obs_g1_rep_pois,
                            "SOCWORK2_obs_g0_rep_pois"=SOCWORK2_obs_g0_rep_pois, "SOCWORK2_obs_g1_rep_pois"=SOCWORK2_obs_g1_rep_pois,
                            "mmu_SOCWORK1_g0_pois"=mmu_SOCWORK1_g0_pois,"mmu_SOCWORK1_g1_pois"=mmu_SOCWORK1_g1_pois,
                            "mmu_SOCWORK2_g0_pois"=mmu_SOCWORK2_g0_pois, "mmu_SOCWORK2_g1_pois"=mmu_SOCWORK2_g1_pois,
                            "ic_waic_pois_COMWORK"=ic_waic_pois_COMWORK, "ic_looic_pois_COMWORK"=ic_waic_pois_COMWORK,
                            "COMWORK1_g0_obs"=COMWORK1_g0_obs, "COMWORK1_g1_obs"=COMWORK1_g1_obs, "COMWORK2_g0_obs"=COMWORK2_g0_obs,"COMWORK2_g1_obs"=COMWORK2_g1_obs,
                            "COMWORK1_obs_g0_rep_pois"=COMWORK1_obs_g0_rep_pois, "COMWORK1_obs_g1_rep_pois"=COMWORK1_obs_g1_rep_pois,
                            "COMWORK2_obs_g0_rep_pois"=COMWORK2_obs_g0_rep_pois, "COMWORK2_obs_g1_rep_pois"=COMWORK2_obs_g1_rep_pois,
                            "mmu_COMWORK1_g0_pois"=mmu_COMWORK1_g0_pois,"mmu_COMWORK1_g1_pois"=mmu_COMWORK1_g1_pois,
                            "mmu_COMWORK2_g0_pois"=mmu_COMWORK2_g0_pois, "mmu_COMWORK2_g1_pois"=mmu_COMWORK2_g1_pois,
                            "ic_waic_pois_GP"=ic_waic_pois_GP, "ic_looic_pois_GP"=ic_waic_pois_GP,
                            "GP1_g0_obs"=GP1_g0_obs, "GP1_g1_obs"=GP1_g1_obs, "GP2_g0_obs"=GP2_g0_obs,"GP2_g1_obs"=GP2_g1_obs,
                            "GP1_obs_g0_rep_pois"=GP1_obs_g0_rep_pois, "GP1_obs_g1_rep_pois"=GP1_obs_g1_rep_pois,
                            "GP2_obs_g0_rep_pois"=GP2_obs_g0_rep_pois, "GP2_obs_g1_rep_pois"=GP2_obs_g1_rep_pois,
                            "mmu_GP1_g0_pois"=mmu_GP1_g0_pois,"mmu_GP1_g1_pois"=mmu_GP1_g1_pois,
                            "mmu_GP2_g0_pois"=mmu_GP2_g0_pois, "mmu_GP2_g1_pois"=mmu_GP2_g1_pois,
                            "ic_waic_pois_NURSE"=ic_waic_pois_NURSE, "ic_looic_pois_NURSE"=ic_waic_pois_NURSE,
                            "NURSE1_g0_obs"=NURSE1_g0_obs, "NURSE1_g1_obs"=NURSE1_g1_obs, "NURSE2_g0_obs"=NURSE2_g0_obs,"NURSE2_g1_obs"=NURSE2_g1_obs,
                            "NURSE1_obs_g0_rep_pois"=NURSE1_obs_g0_rep_pois, "NURSE1_obs_g1_rep_pois"=NURSE1_obs_g1_rep_pois,
                            "NURSE2_obs_g0_rep_pois"=NURSE2_obs_g0_rep_pois, "NURSE2_obs_g1_rep_pois"=NURSE2_obs_g1_rep_pois,
                            "mmu_NURSE1_g0_pois"=mmu_NURSE1_g0_pois,"mmu_NURSE1_g1_pois"=mmu_NURSE1_g1_pois,
                            "mmu_NURSE2_g0_pois"=mmu_NURSE2_g0_pois, "mmu_NURSE2_g1_pois"=mmu_NURSE2_g1_pois,
                            "ic_waic_pois_THERAP"=ic_waic_pois_THERAP, "ic_looic_pois_THERAP"=ic_waic_pois_THERAP,
                            "THERAP1_g0_obs"=THERAP1_g0_obs, "THERAP1_g1_obs"=THERAP1_g1_obs, "THERAP2_g0_obs"=THERAP2_g0_obs,"THERAP2_g1_obs"=THERAP2_g1_obs,
                            "THERAP1_obs_g0_rep_pois"=THERAP1_obs_g0_rep_pois, "THERAP1_obs_g1_rep_pois"=THERAP1_obs_g1_rep_pois,
                            "THERAP2_obs_g0_rep_pois"=THERAP2_obs_g0_rep_pois, "THERAP2_obs_g1_rep_pois"=THERAP2_obs_g1_rep_pois,
                            "mmu_THERAP1_g0_pois"=mmu_THERAP1_g0_pois,"mmu_THERAP1_g1_pois"=mmu_THERAP1_g1_pois,
                            "mmu_THERAP2_g0_pois"=mmu_THERAP2_g0_pois, "mmu_THERAP2_g1_pois"=mmu_THERAP2_g1_pois)

#store results
res_s2_method1_nbinom <- list("jagsModel_nbinom"=jagsModel_nbinom,
                            "ic_waic_nbinom_PSYDR"=ic_waic_nbinom_PSYDR, "ic_looic_nbinom_PSYDR"=ic_waic_nbinom_PSYDR,
                            "PSYDR1_g0_obs"=PSYDR1_g0_obs, "PSYDR1_g1_obs"=PSYDR1_g1_obs, "PSYDR2_g0_obs"=PSYDR2_g0_obs,"PSYDR2_g1_obs"=PSYDR2_g1_obs,
                            "PSYDR1_obs_g0_rep_nbinom"=PSYDR1_obs_g0_rep_nbinom, "PSYDR1_obs_g1_rep_nbinom"=PSYDR1_obs_g1_rep_nbinom,
                            "PSYDR2_obs_g0_rep_nbinom"=PSYDR2_obs_g0_rep_nbinom, "PSYDR2_obs_g1_rep_nbinom"=PSYDR2_obs_g1_rep_nbinom,
                            "mmu_PSYDR1_g0_nbinom"=mmu_PSYDR1_g0_nbinom,"mmu_PSYDR1_g1_nbinom"=mmu_PSYDR1_g1_nbinom,
                            "mmu_PSYDR2_g0_nbinom"=mmu_PSYDR2_g0_nbinom, "mmu_PSYDR2_g1_nbinom"=mmu_PSYDR2_g1_nbinom,
                            "ic_waic_nbinom_PSYCH"=ic_waic_nbinom_PSYCH, "ic_looic_nbinom_PSYCH"=ic_waic_nbinom_PSYCH,
                            "PSYCH1_g0_obs"=PSYCH1_g0_obs, "PSYCH1_g1_obs"=PSYCH1_g1_obs, "PSYCH2_g0_obs"=PSYCH2_g0_obs,"PSYCH2_g1_obs"=PSYCH2_g1_obs,
                            "PSYCH1_obs_g0_rep_nbinom"=PSYCH1_obs_g0_rep_nbinom, "PSYCH1_obs_g1_rep_nbinom"=PSYCH1_obs_g1_rep_nbinom,
                            "PSYCH2_obs_g0_rep_nbinom"=PSYCH2_obs_g0_rep_nbinom, "PSYCH2_obs_g1_rep_nbinom"=PSYCH2_obs_g1_rep_nbinom,
                            "mmu_PSYCH1_g0_nbinom"=mmu_PSYCH1_g0_nbinom,"mmu_PSYCH1_g1_nbinom"=mmu_PSYCH1_g1_nbinom,
                            "mmu_PSYCH2_g0_nbinom"=mmu_PSYCH2_g0_nbinom, "mmu_PSYCH2_g1_nbinom"=mmu_PSYCH2_g1_nbinom,
                            "PHYSI1_g0_obs"=PHYSI1_g0_obs, "PHYSI1_g1_obs"=PHYSI1_g1_obs, "PHYSI2_g0_obs"=PHYSI2_g0_obs,"PHYSI2_g1_obs"=PHYSI2_g1_obs,
                            "PHYSI1_obs_g0_rep_nbinom"=PHYSI1_obs_g0_rep_nbinom, "PHYSI1_obs_g1_rep_nbinom"=PHYSI1_obs_g1_rep_nbinom,
                            "PHYSI2_obs_g0_rep_nbinom"=PHYSI2_obs_g0_rep_nbinom, "PHYSI2_obs_g1_rep_nbinom"=PHYSI2_obs_g1_rep_nbinom,
                            "mmu_PHYSI1_g0_nbinom"=mmu_PHYSI1_g0_nbinom,"mmu_PHYSI1_g1_nbinom"=mmu_PHYSI1_g1_nbinom,
                            "mmu_PHYSI2_g0_nbinom"=mmu_PHYSI2_g0_nbinom, "mmu_PHYSI2_g1_nbinom"=mmu_PHYSI2_g1_nbinom,
                            "ic_waic_nbinom_DENT"=ic_waic_nbinom_DENT, "ic_looic_nbinom_DENT"=ic_waic_nbinom_DENT,
                            "DENT1_g0_obs"=DENT1_g0_obs, "DENT1_g1_obs"=DENT1_g1_obs, "DENT2_g0_obs"=DENT2_g0_obs,"DENT2_g1_obs"=DENT2_g1_obs,
                            "DENT1_obs_g0_rep_nbinom"=DENT1_obs_g0_rep_nbinom, "DENT1_obs_g1_rep_nbinom"=DENT1_obs_g1_rep_nbinom,
                            "DENT2_obs_g0_rep_nbinom"=DENT2_obs_g0_rep_nbinom, "DENT2_obs_g1_rep_nbinom"=DENT2_obs_g1_rep_nbinom,
                            "mmu_DENT1_g0_nbinom"=mmu_DENT1_g0_nbinom,"mmu_DENT1_g1_nbinom"=mmu_DENT1_g1_nbinom,
                            "mmu_DENT2_g0_nbinom"=mmu_DENT2_g0_nbinom, "mmu_DENT2_g1_nbinom"=mmu_DENT2_g1_nbinom,
                            "ic_waic_nbinom_SOCWORK"=ic_waic_nbinom_SOCWORK, "ic_looic_nbinom_SOCWORK"=ic_waic_nbinom_SOCWORK,
                            "SOCWORK1_g0_obs"=SOCWORK1_g0_obs, "SOCWORK1_g1_obs"=SOCWORK1_g1_obs, "SOCWORK2_g0_obs"=SOCWORK2_g0_obs,"SOCWORK2_g1_obs"=SOCWORK2_g1_obs,
                            "SOCWORK1_obs_g0_rep_nbinom"=SOCWORK1_obs_g0_rep_nbinom, "SOCWORK1_obs_g1_rep_nbinom"=SOCWORK1_obs_g1_rep_nbinom,
                            "SOCWORK2_obs_g0_rep_nbinom"=SOCWORK2_obs_g0_rep_nbinom, "SOCWORK2_obs_g1_rep_nbinom"=SOCWORK2_obs_g1_rep_nbinom,
                            "mmu_SOCWORK1_g0_nbinom"=mmu_SOCWORK1_g0_nbinom,"mmu_SOCWORK1_g1_nbinom"=mmu_SOCWORK1_g1_nbinom,
                            "mmu_SOCWORK2_g0_nbinom"=mmu_SOCWORK2_g0_nbinom, "mmu_SOCWORK2_g1_nbinom"=mmu_SOCWORK2_g1_nbinom,
                            "COMWORK1_g0_obs"=COMWORK1_g0_obs, "COMWORK1_g1_obs"=COMWORK1_g1_obs, "COMWORK2_g0_obs"=COMWORK2_g0_obs,"COMWORK2_g1_obs"=COMWORK2_g1_obs,
                            "COMWORK1_obs_g0_rep_nbinom"=COMWORK1_obs_g0_rep_nbinom, "COMWORK1_obs_g1_rep_nbinom"=COMWORK1_obs_g1_rep_nbinom,
                            "COMWORK2_obs_g0_rep_nbinom"=COMWORK2_obs_g0_rep_nbinom, "COMWORK2_obs_g1_rep_nbinom"=COMWORK2_obs_g1_rep_nbinom,
                            "mmu_COMWORK1_g0_nbinom"=mmu_COMWORK1_g0_nbinom,"mmu_COMWORK1_g1_nbinom"=mmu_COMWORK1_g1_nbinom,
                            "mmu_COMWORK2_g0_nbinom"=mmu_COMWORK2_g0_nbinom, "mmu_COMWORK2_g1_nbinom"=mmu_COMWORK2_g1_nbinom,
                            "GP1_g0_obs"=GP1_g0_obs, "GP1_g1_obs"=GP1_g1_obs, "GP2_g0_obs"=GP2_g0_obs,"GP2_g1_obs"=GP2_g1_obs,
                            "GP1_obs_g0_rep_nbinom"=GP1_obs_g0_rep_nbinom, "GP1_obs_g1_rep_nbinom"=GP1_obs_g1_rep_nbinom,
                            "GP2_obs_g0_rep_nbinom"=GP2_obs_g0_rep_nbinom, "GP2_obs_g1_rep_nbinom"=GP2_obs_g1_rep_nbinom,
                            "mmu_GP1_g0_nbinom"=mmu_GP1_g0_nbinom,"mmu_GP1_g1_nbinom"=mmu_GP1_g1_nbinom,
                            "mmu_GP2_g0_nbinom"=mmu_GP2_g0_nbinom, "mmu_GP2_g1_nbinom"=mmu_GP2_g1_nbinom,
                            "ic_waic_nbinom_NURSE"=ic_waic_nbinom_NURSE, "ic_looic_nbinom_NURSE"=ic_waic_nbinom_NURSE,
                            "NURSE1_g0_obs"=NURSE1_g0_obs, "NURSE1_g1_obs"=NURSE1_g1_obs, "NURSE2_g0_obs"=NURSE2_g0_obs,"NURSE2_g1_obs"=NURSE2_g1_obs,
                            "NURSE1_obs_g0_rep_nbinom"=NURSE1_obs_g0_rep_nbinom, "NURSE1_obs_g1_rep_nbinom"=NURSE1_obs_g1_rep_nbinom,
                            "NURSE2_obs_g0_rep_nbinom"=NURSE2_obs_g0_rep_nbinom, "NURSE2_obs_g1_rep_nbinom"=NURSE2_obs_g1_rep_nbinom,
                            "mmu_NURSE1_g0_nbinom"=mmu_NURSE1_g0_nbinom,"mmu_NURSE1_g1_nbinom"=mmu_NURSE1_g1_nbinom,
                            "mmu_NURSE2_g0_nbinom"=mmu_NURSE2_g0_nbinom, "mmu_NURSE2_g1_nbinom"=mmu_NURSE2_g1_nbinom,
                            "ic_waic_nbinom_THERAP"=ic_waic_nbinom_THERAP, "ic_looic_nbinom_THERAP"=ic_waic_nbinom_THERAP,
                            "THERAP1_g0_obs"=THERAP1_g0_obs, "THERAP1_g1_obs"=THERAP1_g1_obs, "THERAP2_g0_obs"=THERAP2_g0_obs,"THERAP2_g1_obs"=THERAP2_g1_obs,
                            "THERAP1_obs_g0_rep_nbinom"=THERAP1_obs_g0_rep_nbinom, "THERAP1_obs_g1_rep_nbinom"=THERAP1_obs_g1_rep_nbinom,
                            "THERAP2_obs_g0_rep_nbinom"=THERAP2_obs_g0_rep_nbinom, "THERAP2_obs_g1_rep_nbinom"=THERAP2_obs_g1_rep_nbinom,
                            "mmu_THERAP1_g0_nbinom"=mmu_THERAP1_g0_nbinom,"mmu_THERAP1_g1_nbinom"=mmu_THERAP1_g1_nbinom,
                            "mmu_THERAP2_g0_nbinom"=mmu_THERAP2_g0_nbinom, "mmu_THERAP2_g1_nbinom"=mmu_THERAP2_g1_nbinom)

res_s3_method1 <- list("res_s2_method1_norm"=res_s2_method1_norm,
                       "res_s2_method1_pois"=res_s2_method1_pois,
                       "res_s2_method1_nbinom"=res_s2_method1_nbinom)
#saveRDS(res_s3_method1,"res_s3_method1.rds")
res_s3_method1 <- readRDS("res_s3_method1.rds")

#final joint model
res_s3_method1_pois_final <- list("jagsModel_pois_final"=jagsModel_pois_final, "mmu_qaly_g0_norm"=mmu_qaly_g0_norm,
                                   "mmu_qaly_g1_norm"=mmu_qaly_g1_norm, "delta_qaly_norm"=delta_qaly_norm,
                                   "mmu_eq5d0_g0_norm"=mmu_eq5d0_g0_norm,"mmu_eq5d0_g1_norm"=mmu_eq5d0_g1_norm,
                                   "mmu_eq5d1_g0_norm"=mmu_eq5d1_g0_norm,"mmu_eq5d1_g1_norm"=mmu_eq5d1_g1_norm,
                                   "mmu_eq5d2_g0_norm"=mmu_eq5d2_g0_norm,"mmu_eq5d2_g1_norm"=mmu_eq5d2_g1_norm)
#saveRDS(res_s3_method1_pois_final,"res_s3_method1_pois_final.rds")

library(HDInterval)
c(mean(res_s3_method1$res_s2_method1_norm$mmu_PSYDR1_g0_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_PSYDR1_g0_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_PSYDR1_g1_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_PSYDR1_g1_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_PSYDR2_g0_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_PSYDR2_g0_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_PSYDR2_g1_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_PSYDR2_g1_norm, credMass = 0.95))

c(mean(res_s3_method1$res_s2_method1_norm$mmu_PSYCH1_g0_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_PSYCH1_g0_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_PSYCH1_g1_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_PSYCH1_g1_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_PSYCH2_g0_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_PSYCH2_g0_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_PSYCH2_g1_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_PSYCH2_g1_norm, credMass = 0.95))

c(mean(res_s3_method1$res_s2_method1_norm$mmu_PHYSI1_g0_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_PHYSI1_g0_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_PHYSI1_g1_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_PHYSI1_g1_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_PHYSI2_g0_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_PHYSI2_g0_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_PHYSI2_g1_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_PHYSI2_g1_norm, credMass = 0.95))

c(mean(res_s3_method1$res_s2_method1_norm$mmu_DENT1_g0_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_DENT1_g0_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_DENT1_g1_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_DENT1_g1_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_DENT2_g0_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_DENT2_g0_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_DENT2_g1_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_DENT2_g1_norm, credMass = 0.95))

c(mean(res_s3_method1$res_s2_method1_norm$mmu_SOCWORK1_g0_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_SOCWORK1_g0_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_SOCWORK1_g1_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_SOCWORK1_g1_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_SOCWORK2_g0_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_SOCWORK2_g0_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_SOCWORK2_g1_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_SOCWORK2_g1_norm, credMass = 0.95))

c(mean(res_s3_method1$res_s2_method1_norm$mmu_COMWORK1_g0_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_COMWORK1_g0_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_COMWORK1_g1_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_COMWORK1_g1_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_COMWORK2_g0_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_COMWORK2_g0_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_COMWORK2_g1_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_COMWORK2_g1_norm, credMass = 0.95))

c(mean(res_s3_method1$res_s2_method1_norm$mmu_GP1_g0_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_GP1_g0_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_GP1_g1_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_GP1_g1_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_GP2_g0_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_GP2_g0_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_GP2_g1_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_GP2_g1_norm, credMass = 0.95))

c(mean(res_s3_method1$res_s2_method1_norm$mmu_NURSE1_g0_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_NURSE1_g0_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_NURSE1_g1_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_NURSE1_g1_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_NURSE2_g0_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_NURSE2_g0_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_NURSE2_g1_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_NURSE2_g1_norm, credMass = 0.95))

c(mean(res_s3_method1$res_s2_method1_norm$mmu_THERAP1_g0_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_THERAP1_g0_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_THERAP1_g1_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_THERAP1_g1_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_THERAP2_g0_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_THERAP2_g0_norm, credMass = 0.95))
c(mean(res_s3_method1$res_s2_method1_norm$mmu_THERAP2_g1_norm),hdi(res_s3_method1$res_s2_method1_norm$mmu_THERAP2_g1_norm, credMass = 0.95))


#apply unit cost to get TC
mmu_PSYDR_c1_g0_norm <- res_s3_method1$res_s2_method1_norm$mmu_PSYDR1_g0_norm*39
mmu_PSYDR_c1_g1_norm <- res_s3_method1$res_s2_method1_norm$mmu_PSYDR1_g1_norm*39
mmu_PSYDR_c2_g0_norm <- res_s3_method1$res_s2_method1_norm$mmu_PSYDR2_g0_norm*39
mmu_PSYDR_c2_g1_norm <- res_s3_method1$res_s2_method1_norm$mmu_PSYDR2_g1_norm*39
mmu_PSYCH_c1_g0_norm <- res_s3_method1$res_s2_method1_norm$mmu_PSYCH1_g0_norm*52
mmu_PSYCH_c1_g1_norm <- res_s3_method1$res_s2_method1_norm$mmu_PSYCH1_g1_norm*52
mmu_PSYCH_c2_g0_norm <- res_s3_method1$res_s2_method1_norm$mmu_PSYCH2_g0_norm*52
mmu_PSYCH_c2_g1_norm <- res_s3_method1$res_s2_method1_norm$mmu_PSYCH2_g1_norm*52
mmu_PHYSI_c1_g0_norm <- res_s3_method1$res_s2_method1_norm$mmu_PHYSI1_g0_norm*52
mmu_PHYSI_c1_g1_norm <- res_s3_method1$res_s2_method1_norm$mmu_PHYSI1_g1_norm*52
mmu_PHYSI_c2_g0_norm <- res_s3_method1$res_s2_method1_norm$mmu_PHYSI2_g0_norm*52
mmu_PHYSI_c2_g1_norm <- res_s3_method1$res_s2_method1_norm$mmu_PHYSI2_g1_norm*52
mmu_DENT_c1_g0_norm <- res_s3_method1$res_s2_method1_norm$mmu_DENT1_g0_norm*71
mmu_DENT_c1_g1_norm <- res_s3_method1$res_s2_method1_norm$mmu_DENT1_g1_norm*71
mmu_DENT_c2_g0_norm <- res_s3_method1$res_s2_method1_norm$mmu_DENT2_g0_norm*71
mmu_DENT_c2_g1_norm <- res_s3_method1$res_s2_method1_norm$mmu_DENT2_g1_norm*71
mmu_SOCWORK_c1_g0_norm <- res_s3_method1$res_s2_method1_norm$mmu_SOCWORK1_g0_norm*55
mmu_SOCWORK_c1_g1_norm <- res_s3_method1$res_s2_method1_norm$mmu_SOCWORK1_g1_norm*55
mmu_SOCWORK_c2_g0_norm <- res_s3_method1$res_s2_method1_norm$mmu_SOCWORK2_g0_norm*55
mmu_SOCWORK_c2_g1_norm <- res_s3_method1$res_s2_method1_norm$mmu_SOCWORK2_g1_norm*55
mmu_COMWORK_c1_g0_norm <- res_s3_method1$res_s2_method1_norm$mmu_COMWORK1_g0_norm*51
mmu_COMWORK_c1_g1_norm <- res_s3_method1$res_s2_method1_norm$mmu_COMWORK1_g1_norm*51
mmu_COMWORK_c2_g0_norm <- res_s3_method1$res_s2_method1_norm$mmu_COMWORK2_g0_norm*51
mmu_COMWORK_c2_g1_norm <- res_s3_method1$res_s2_method1_norm$mmu_COMWORK2_g1_norm*51
mmu_GP_c1_g0_norm <- res_s3_method1$res_s2_method1_norm$mmu_GP1_g0_norm*((33+68+20)/3)
mmu_GP_c1_g1_norm <- res_s3_method1$res_s2_method1_norm$mmu_GP1_g1_norm*((33+68+20)/3)
mmu_GP_c2_g0_norm <- res_s3_method1$res_s2_method1_norm$mmu_GP2_g0_norm*((33+68+20)/3)
mmu_GP_c2_g1_norm <- res_s3_method1$res_s2_method1_norm$mmu_GP2_g1_norm*((33+68+20)/3)
mmu_NURSE_c1_g0_norm <- res_s3_method1$res_s2_method1_norm$mmu_NURSE1_g0_norm*((39+17.5+17.5)/3)
mmu_NURSE_c1_g1_norm <- res_s3_method1$res_s2_method1_norm$mmu_NURSE1_g1_norm*((39+17.5+17.5)/3)
mmu_NURSE_c2_g0_norm <- res_s3_method1$res_s2_method1_norm$mmu_NURSE2_g0_norm*((39+17.5+17.5)/3)
mmu_NURSE_c2_g1_norm <- res_s3_method1$res_s2_method1_norm$mmu_NURSE2_g1_norm*((39+17.5+17.5)/3)
mmu_THERAP_c1_g0_norm <- res_s3_method1$res_s2_method1_norm$mmu_THERAP1_g0_norm*((33+68+85+84)/4)
mmu_THERAP_c1_g1_norm <- res_s3_method1$res_s2_method1_norm$mmu_THERAP1_g1_norm*((33+68+85+84)/4)
mmu_THERAP_c2_g0_norm <- res_s3_method1$res_s2_method1_norm$mmu_THERAP2_g0_norm*((33+68+85+84)/4)
mmu_THERAP_c2_g1_norm <- res_s3_method1$res_s2_method1_norm$mmu_THERAP2_g1_norm*((33+68+85+84)/4)


mmu_PSYDR_c1_g0_pois <- res_s3_method1$res_s2_method1_pois$mmu_PSYDR1_g0_pois*39
mmu_PSYDR_c1_g1_pois <- res_s3_method1$res_s2_method1_pois$mmu_PSYDR1_g1_pois*39
mmu_PSYDR_c2_g0_pois <- res_s3_method1$res_s2_method1_pois$mmu_PSYDR2_g0_pois*39
mmu_PSYDR_c2_g1_pois <- res_s3_method1$res_s2_method1_pois$mmu_PSYDR2_g1_pois*39
mmu_PSYCH_c1_g0_pois <- res_s3_method1$res_s2_method1_pois$mmu_PSYCH1_g0_pois*52
mmu_PSYCH_c1_g1_pois <- res_s3_method1$res_s2_method1_pois$mmu_PSYCH1_g1_pois*52
mmu_PSYCH_c2_g0_pois <- res_s3_method1$res_s2_method1_pois$mmu_PSYCH2_g0_pois*52
mmu_PSYCH_c2_g1_pois <- res_s3_method1$res_s2_method1_pois$mmu_PSYCH2_g1_pois*52
mmu_PHYSI_c1_g0_pois <- res_s3_method1$res_s2_method1_pois$mmu_PHYSI1_g0_pois*52
mmu_PHYSI_c1_g1_pois <- res_s3_method1$res_s2_method1_pois$mmu_PHYSI1_g1_pois*52
mmu_PHYSI_c2_g0_pois <- res_s3_method1$res_s2_method1_pois$mmu_PHYSI2_g0_pois*52
mmu_PHYSI_c2_g1_pois <- res_s3_method1$res_s2_method1_pois$mmu_PHYSI2_g1_pois*52
mmu_DENT_c1_g0_pois <- res_s3_method1$res_s2_method1_pois$mmu_DENT1_g0_pois*71
mmu_DENT_c1_g1_pois <- res_s3_method1$res_s2_method1_pois$mmu_DENT1_g1_pois*71
mmu_DENT_c2_g0_pois <- res_s3_method1$res_s2_method1_pois$mmu_DENT2_g0_pois*71
mmu_DENT_c2_g1_pois <- res_s3_method1$res_s2_method1_pois$mmu_DENT2_g1_pois*71
mmu_SOCWORK_c1_g0_pois <- res_s3_method1$res_s2_method1_pois$mmu_SOCWORK1_g0_pois*55
mmu_SOCWORK_c1_g1_pois <- res_s3_method1$res_s2_method1_pois$mmu_SOCWORK1_g1_pois*55
mmu_SOCWORK_c2_g0_pois <- res_s3_method1$res_s2_method1_pois$mmu_SOCWORK2_g0_pois*55
mmu_SOCWORK_c2_g1_pois <- res_s3_method1$res_s2_method1_pois$mmu_SOCWORK2_g1_pois*55
mmu_COMWORK_c1_g0_pois <- res_s3_method1$res_s2_method1_pois$mmu_COMWORK1_g0_pois*51
mmu_COMWORK_c1_g1_pois <- res_s3_method1$res_s2_method1_pois$mmu_COMWORK1_g1_pois*51
mmu_COMWORK_c2_g0_pois <- res_s3_method1$res_s2_method1_pois$mmu_COMWORK2_g0_pois*51
mmu_COMWORK_c2_g1_pois <- res_s3_method1$res_s2_method1_pois$mmu_COMWORK2_g1_pois*51
mmu_GP_c1_g0_pois <- res_s3_method1$res_s2_method1_pois$mmu_GP1_g0_pois*((33+68+20)/3)
mmu_GP_c1_g1_pois <- res_s3_method1$res_s2_method1_pois$mmu_GP1_g1_pois*((33+68+20)/3)
mmu_GP_c2_g0_pois <- res_s3_method1$res_s2_method1_pois$mmu_GP2_g0_pois*((33+68+20)/3)
mmu_GP_c2_g1_pois <- res_s3_method1$res_s2_method1_pois$mmu_GP2_g1_pois*((33+68+20)/3)
mmu_NURSE_c1_g0_pois <- res_s3_method1$res_s2_method1_pois$mmu_NURSE1_g0_pois*((39+17.5+17.5)/3)
mmu_NURSE_c1_g1_pois <- res_s3_method1$res_s2_method1_pois$mmu_NURSE1_g1_pois*((39+17.5+17.5)/3)
mmu_NURSE_c2_g0_pois <- res_s3_method1$res_s2_method1_pois$mmu_NURSE2_g0_pois*((39+17.5+17.5)/3)
mmu_NURSE_c2_g1_pois <- res_s3_method1$res_s2_method1_pois$mmu_NURSE2_g1_pois*((39+17.5+17.5)/3)
mmu_THERAP_c1_g0_pois <- res_s3_method1$res_s2_method1_pois$mmu_THERAP1_g0_pois*((33+68+85+84)/4)
mmu_THERAP_c1_g1_pois <- res_s3_method1$res_s2_method1_pois$mmu_THERAP1_g1_pois*((33+68+85+84)/4)
mmu_THERAP_c2_g0_pois <- res_s3_method1$res_s2_method1_pois$mmu_THERAP2_g0_pois*((33+68+85+84)/4)
mmu_THERAP_c2_g1_pois <- res_s3_method1$res_s2_method1_pois$mmu_THERAP2_g1_pois*((33+68+85+84)/4)


mmu_PSYDR_c1_g0_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_PSYDR1_g0_nbinom*39
mmu_PSYDR_c1_g1_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_PSYDR1_g1_nbinom*39
mmu_PSYDR_c2_g0_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_PSYDR2_g0_nbinom*39
mmu_PSYDR_c2_g1_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_PSYDR2_g1_nbinom*39
mmu_PSYCH_c1_g0_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_PSYCH1_g0_nbinom*52
mmu_PSYCH_c1_g1_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_PSYCH1_g1_nbinom*52
mmu_PSYCH_c2_g0_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_PSYCH2_g0_nbinom*52
mmu_PSYCH_c2_g1_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_PSYCH2_g1_nbinom*52
mmu_PHYSI_c1_g0_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_PHYSI1_g0_nbinom*52
mmu_PHYSI_c1_g1_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_PHYSI1_g1_nbinom*52
mmu_PHYSI_c2_g0_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_PHYSI2_g0_nbinom*52
mmu_PHYSI_c2_g1_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_PHYSI2_g1_nbinom*52
mmu_DENT_c1_g0_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_DENT1_g0_nbinom*71
mmu_DENT_c1_g1_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_DENT1_g1_nbinom*71
mmu_DENT_c2_g0_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_DENT2_g0_nbinom*71
mmu_DENT_c2_g1_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_DENT2_g1_nbinom*71
mmu_SOCWORK_c1_g0_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_SOCWORK1_g0_nbinom*55
mmu_SOCWORK_c1_g1_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_SOCWORK1_g1_nbinom*55
mmu_SOCWORK_c2_g0_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_SOCWORK2_g0_nbinom*55
mmu_SOCWORK_c2_g1_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_SOCWORK2_g1_nbinom*55
mmu_COMWORK_c1_g0_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_COMWORK1_g0_nbinom*51
mmu_COMWORK_c1_g1_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_COMWORK1_g1_nbinom*51
mmu_COMWORK_c2_g0_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_COMWORK2_g0_nbinom*51
mmu_COMWORK_c2_g1_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_COMWORK2_g1_nbinom*51
mmu_GP_c1_g0_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_GP1_g0_nbinom*((33+68+20)/3)
mmu_GP_c1_g1_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_GP1_g1_nbinom*((33+68+20)/3)
mmu_GP_c2_g0_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_GP2_g0_nbinom*((33+68+20)/3)
mmu_GP_c2_g1_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_GP2_g1_nbinom*((33+68+20)/3)
mmu_NURSE_c1_g0_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_NURSE1_g0_nbinom*((39+17.5+17.5)/3)
mmu_NURSE_c1_g1_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_NURSE1_g1_nbinom*((39+17.5+17.5)/3)
mmu_NURSE_c2_g0_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_NURSE2_g0_nbinom*((39+17.5+17.5)/3)
mmu_NURSE_c2_g1_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_NURSE2_g1_nbinom*((39+17.5+17.5)/3)
mmu_THERAP_c1_g0_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_THERAP1_g0_nbinom*((33+68+85+84)/4)
mmu_THERAP_c1_g1_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_THERAP1_g1_nbinom*((33+68+85+84)/4)
mmu_THERAP_c2_g0_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_THERAP2_g0_nbinom*((33+68+85+84)/4)
mmu_THERAP_c2_g1_nbinom <- res_s3_method1$res_s2_method1_nbinom$mmu_THERAP2_g1_nbinom*((33+68+85+84)/4)

#combine costs to get total costs at same time across types
mmu_all1_tc_g0_norm <- mmu_PSYDR_c1_g0_norm + mmu_PSYCH_c1_g0_norm + mmu_PHYSI_c1_g0_norm + mmu_DENT_c1_g0_norm +
  mmu_SOCWORK_c1_g0_norm + mmu_COMWORK_c1_g0_norm + mmu_GP_c1_g0_norm + mmu_NURSE_c1_g0_norm + mmu_THERAP_c1_g0_norm
mmu_all1_tc_g1_norm <- mmu_PSYDR_c1_g1_norm + mmu_PSYCH_c1_g1_norm + mmu_PHYSI_c1_g1_norm + mmu_DENT_c1_g1_norm +
  mmu_SOCWORK_c1_g1_norm + mmu_COMWORK_c1_g1_norm + mmu_GP_c1_g1_norm + mmu_NURSE_c1_g1_norm + mmu_THERAP_c1_g1_norm
mmu_all2_tc_g0_norm <- mmu_PSYDR_c2_g0_norm + mmu_PSYCH_c2_g0_norm + mmu_PHYSI_c2_g0_norm + mmu_DENT_c2_g0_norm +
  mmu_SOCWORK_c2_g0_norm + mmu_COMWORK_c2_g0_norm + mmu_GP_c2_g0_norm + mmu_NURSE_c2_g0_norm + mmu_THERAP_c2_g0_norm
mmu_all2_tc_g1_norm <- mmu_PSYDR_c2_g1_norm + mmu_PSYCH_c2_g1_norm + mmu_PHYSI_c2_g1_norm + mmu_DENT_c2_g1_norm +
  mmu_SOCWORK_c2_g1_norm + mmu_COMWORK_c2_g1_norm + mmu_GP_c2_g1_norm + mmu_NURSE_c2_g1_norm + mmu_THERAP_c2_g1_norm


mmu_all1_tc_g0_pois <- mmu_PSYDR_c1_g0_pois + mmu_PSYCH_c1_g0_pois + mmu_PHYSI_c1_g0_pois + mmu_DENT_c1_g0_pois +
  mmu_SOCWORK_c1_g0_pois + mmu_COMWORK_c1_g0_pois + mmu_GP_c1_g0_pois + mmu_NURSE_c1_g0_pois + mmu_THERAP_c1_g0_pois
mmu_all1_tc_g1_pois <- mmu_PSYDR_c1_g1_pois + mmu_PSYCH_c1_g1_pois + mmu_PHYSI_c1_g1_pois + mmu_DENT_c1_g1_pois +
  mmu_SOCWORK_c1_g1_pois + mmu_COMWORK_c1_g1_pois + mmu_GP_c1_g1_pois + mmu_NURSE_c1_g1_pois + mmu_THERAP_c1_g1_pois
mmu_all2_tc_g0_pois <- mmu_PSYDR_c2_g0_pois + mmu_PSYCH_c2_g0_pois + mmu_PHYSI_c2_g0_pois + mmu_DENT_c2_g0_pois +
  mmu_SOCWORK_c2_g0_pois + mmu_COMWORK_c2_g0_pois + mmu_GP_c2_g0_pois + mmu_NURSE_c2_g0_pois + mmu_THERAP_c2_g0_pois
mmu_all2_tc_g1_pois <- mmu_PSYDR_c2_g1_pois + mmu_PSYCH_c2_g1_pois + mmu_PHYSI_c2_g1_pois + mmu_DENT_c2_g1_pois +
  mmu_SOCWORK_c2_g1_pois + mmu_COMWORK_c2_g1_pois + mmu_GP_c2_g1_pois + mmu_NURSE_c2_g1_pois + mmu_THERAP_c2_g1_pois


mmu_all1_tc_g0_nbinom <- mmu_PSYDR_c1_g0_nbinom + mmu_PSYCH_c1_g0_nbinom + mmu_PHYSI_c1_g0_nbinom + mmu_DENT_c1_g0_nbinom +
  mmu_SOCWORK_c1_g0_nbinom + mmu_COMWORK_c1_g0_nbinom + mmu_GP_c1_g0_nbinom + mmu_NURSE_c1_g0_nbinom + mmu_THERAP_c1_g0_nbinom
mmu_all1_tc_g1_nbinom <- mmu_PSYDR_c1_g1_nbinom + mmu_PSYCH_c1_g1_nbinom + mmu_PHYSI_c1_g1_nbinom + mmu_DENT_c1_g1_nbinom +
  mmu_SOCWORK_c1_g1_nbinom + mmu_COMWORK_c1_g1_nbinom + mmu_GP_c1_g1_nbinom + mmu_NURSE_c1_g1_nbinom + mmu_THERAP_c1_g1_nbinom
mmu_all2_tc_g0_nbinom <- mmu_PSYDR_c2_g0_nbinom + mmu_PSYCH_c2_g0_nbinom + mmu_PHYSI_c2_g0_nbinom + mmu_DENT_c2_g0_nbinom +
  mmu_SOCWORK_c2_g0_nbinom + mmu_COMWORK_c2_g0_nbinom + mmu_GP_c2_g0_nbinom + mmu_NURSE_c2_g0_nbinom + mmu_THERAP_c2_g0_nbinom
mmu_all2_tc_g1_nbinom <- mmu_PSYDR_c2_g1_nbinom + mmu_PSYCH_c2_g1_nbinom + mmu_PHYSI_c2_g1_nbinom + mmu_DENT_c2_g1_nbinom +
  mmu_SOCWORK_c2_g1_nbinom + mmu_COMWORK_c2_g1_nbinom + mmu_GP_c2_g1_nbinom + mmu_NURSE_c2_g1_nbinom + mmu_THERAP_c2_g1_nbinom


#combine costs to get total costs for each type over time
mmu_PSYDR_tc_g0_norm <- mmu_PSYDR_c1_g0_norm + mmu_PSYDR_c2_g0_norm
mmu_PSYDR_tc_g1_norm <- mmu_PSYDR_c1_g1_norm + mmu_PSYDR_c2_g1_norm
mmu_PSYCH_tc_g0_norm <- mmu_PSYCH_c1_g0_norm + mmu_PSYCH_c2_g0_norm
mmu_PSYCH_tc_g1_norm <- mmu_PSYCH_c1_g1_norm + mmu_PSYCH_c2_g1_norm
mmu_PHYSI_tc_g0_norm <- mmu_PHYSI_c1_g0_norm + mmu_PHYSI_c2_g0_norm
mmu_PHYSI_tc_g1_norm <- mmu_PHYSI_c1_g1_norm + mmu_PHYSI_c2_g1_norm
mmu_DENT_tc_g0_norm <- mmu_DENT_c1_g0_norm + mmu_DENT_c2_g0_norm
mmu_DENT_tc_g1_norm <- mmu_DENT_c1_g1_norm + mmu_DENT_c2_g1_norm
mmu_SOCWORK_tc_g0_norm <- mmu_SOCWORK_c1_g0_norm + mmu_SOCWORK_c2_g0_norm
mmu_SOCWORK_tc_g1_norm <- mmu_SOCWORK_c1_g1_norm + mmu_SOCWORK_c2_g1_norm
mmu_COMWORK_tc_g0_norm <- mmu_COMWORK_c1_g0_norm + mmu_COMWORK_c2_g0_norm
mmu_COMWORK_tc_g1_norm <- mmu_COMWORK_c1_g1_norm + mmu_COMWORK_c2_g1_norm
mmu_GP_tc_g0_norm <- mmu_GP_c1_g0_norm + mmu_GP_c2_g0_norm
mmu_GP_tc_g1_norm <- mmu_GP_c1_g1_norm + mmu_GP_c2_g1_norm
mmu_NURSE_tc_g0_norm <- mmu_NURSE_c1_g0_norm + mmu_NURSE_c2_g0_norm
mmu_NURSE_tc_g1_norm <- mmu_NURSE_c1_g1_norm + mmu_NURSE_c2_g1_norm
mmu_THERAP_tc_g0_norm <- mmu_THERAP_c1_g0_norm + mmu_THERAP_c2_g0_norm
mmu_THERAP_tc_g1_norm <- mmu_THERAP_c1_g1_norm + mmu_THERAP_c2_g1_norm


mmu_PSYDR_tc_g0_pois <- mmu_PSYDR_c1_g0_pois + mmu_PSYDR_c2_g0_pois
mmu_PSYDR_tc_g1_pois <- mmu_PSYDR_c1_g1_pois + mmu_PSYDR_c2_g1_pois
mmu_PSYCH_tc_g0_pois <- mmu_PSYCH_c1_g0_pois + mmu_PSYCH_c2_g0_pois
mmu_PSYCH_tc_g1_pois <- mmu_PSYCH_c1_g1_pois + mmu_PSYCH_c2_g1_pois
mmu_PHYSI_tc_g0_pois <- mmu_PHYSI_c1_g0_pois + mmu_PHYSI_c2_g0_pois
mmu_PHYSI_tc_g1_pois <- mmu_PHYSI_c1_g1_pois + mmu_PHYSI_c2_g1_pois
mmu_DENT_tc_g0_pois <- mmu_DENT_c1_g0_pois + mmu_DENT_c2_g0_pois
mmu_DENT_tc_g1_pois <- mmu_DENT_c1_g1_pois + mmu_DENT_c2_g1_pois
mmu_SOCWORK_tc_g0_pois <- mmu_SOCWORK_c1_g0_pois + mmu_SOCWORK_c2_g0_pois
mmu_SOCWORK_tc_g1_pois <- mmu_SOCWORK_c1_g1_pois + mmu_SOCWORK_c2_g1_pois
mmu_COMWORK_tc_g0_pois <- mmu_COMWORK_c1_g0_pois + mmu_COMWORK_c2_g0_pois
mmu_COMWORK_tc_g1_pois <- mmu_COMWORK_c1_g1_pois + mmu_COMWORK_c2_g1_pois
mmu_GP_tc_g0_pois <- mmu_GP_c1_g0_pois + mmu_GP_c2_g0_pois
mmu_GP_tc_g1_pois <- mmu_GP_c1_g1_pois + mmu_GP_c2_g1_pois
mmu_NURSE_tc_g0_pois <- mmu_NURSE_c1_g0_pois + mmu_NURSE_c2_g0_pois
mmu_NURSE_tc_g1_pois <- mmu_NURSE_c1_g1_pois + mmu_NURSE_c2_g1_pois
mmu_THERAP_tc_g0_pois <- mmu_THERAP_c1_g0_pois + mmu_THERAP_c2_g0_pois
mmu_THERAP_tc_g1_pois <- mmu_THERAP_c1_g1_pois + mmu_THERAP_c2_g1_pois


mmu_PSYDR_tc_g0_nbinom <- mmu_PSYDR_c1_g0_nbinom + mmu_PSYDR_c2_g0_nbinom
mmu_PSYDR_tc_g1_nbinom <- mmu_PSYDR_c1_g1_nbinom + mmu_PSYDR_c2_g1_nbinom
mmu_PSYCH_tc_g0_nbinom <- mmu_PSYCH_c1_g0_nbinom + mmu_PSYCH_c2_g0_nbinom
mmu_PSYCH_tc_g1_nbinom <- mmu_PSYCH_c1_g1_nbinom + mmu_PSYCH_c2_g1_nbinom
mmu_PHYSI_tc_g0_nbinom <- mmu_PHYSI_c1_g0_nbinom + mmu_PHYSI_c2_g0_nbinom
mmu_PHYSI_tc_g1_nbinom <- mmu_PHYSI_c1_g1_nbinom + mmu_PHYSI_c2_g1_nbinom
mmu_DENT_tc_g0_nbinom <- mmu_DENT_c1_g0_nbinom + mmu_DENT_c2_g0_nbinom
mmu_DENT_tc_g1_nbinom <- mmu_DENT_c1_g1_nbinom + mmu_DENT_c2_g1_nbinom
mmu_SOCWORK_tc_g0_nbinom <- mmu_SOCWORK_c1_g0_nbinom + mmu_SOCWORK_c2_g0_nbinom
mmu_SOCWORK_tc_g1_nbinom <- mmu_SOCWORK_c1_g1_nbinom + mmu_SOCWORK_c2_g1_nbinom
mmu_COMWORK_tc_g0_nbinom <- mmu_COMWORK_c1_g0_nbinom + mmu_COMWORK_c2_g0_nbinom
mmu_COMWORK_tc_g1_nbinom <- mmu_COMWORK_c1_g1_nbinom + mmu_COMWORK_c2_g1_nbinom
mmu_GP_tc_g0_nbinom <- mmu_GP_c1_g0_nbinom + mmu_GP_c2_g0_nbinom
mmu_GP_tc_g1_nbinom <- mmu_GP_c1_g1_nbinom + mmu_GP_c2_g1_nbinom
mmu_NURSE_tc_g0_nbinom <- mmu_NURSE_c1_g0_nbinom + mmu_NURSE_c2_g0_nbinom
mmu_NURSE_tc_g1_nbinom <- mmu_NURSE_c1_g1_nbinom + mmu_NURSE_c2_g1_nbinom
mmu_THERAP_tc_g0_nbinom <- mmu_THERAP_c1_g0_nbinom + mmu_THERAP_c2_g0_nbinom
mmu_THERAP_tc_g1_nbinom <- mmu_THERAP_c1_g1_nbinom + mmu_THERAP_c2_g1_nbinom

#compute total costs across types and over time
mmu_all_tc_g0_norm <- mmu_all1_tc_g0_norm + mmu_all2_tc_g0_norm
mmu_all_tc_g1_norm <- mmu_all1_tc_g1_norm + mmu_all2_tc_g1_norm
mmu_all_tc_g0_pois <- mmu_all1_tc_g0_pois + mmu_all2_tc_g0_pois
mmu_all_tc_g1_pois <- mmu_all1_tc_g1_pois + mmu_all2_tc_g1_pois
mmu_all_tc_g0_nbinom <- mmu_all1_tc_g0_nbinom + mmu_all2_tc_g0_nbinom
mmu_all_tc_g1_nbinom <- mmu_all1_tc_g1_nbinom + mmu_all2_tc_g1_nbinom

#summarise results between groups for all outcomes
library(HDInterval)
hist(mmu_PSYDR_c1_g0_norm)
summary(mmu_PSYDR_c1_g0_norm)
hist(mmu_PSYDR_c1_g1_norm)
summary(mmu_PSYDR_c1_g1_norm)
delta_PSYDR_c1_norm <- mmu_PSYDR_c1_g1_norm - mmu_PSYDR_c1_g0_norm
hist(delta_PSYDR_c1_norm)
summary(delta_PSYDR_c1_norm)
c(mean(delta_PSYDR_c1_norm),hdi(delta_PSYDR_c1_norm, credMass = 0.95))
hist(mmu_PSYCH_c1_g0_norm)
summary(mmu_PSYCH_c1_g0_norm)
hist(mmu_PSYCH_c1_g1_norm)
summary(mmu_PSYCH_c1_g1_norm)
delta_PSYCH_c1_norm <- mmu_PSYCH_c1_g1_norm - mmu_PSYCH_c1_g0_norm
hist(delta_PSYCH_c1_norm)
summary(delta_PSYCH_c1_norm)
c(mean(delta_PSYCH_c1_norm),hdi(delta_PSYCH_c1_norm, credMass = 0.95))
hist(mmu_PHYSI_c1_g0_norm)
summary(mmu_PHYSI_c1_g0_norm)
hist(mmu_PHYSI_c1_g1_norm)
summary(mmu_PHYSI_c1_g1_norm)
delta_PHYSI_c1_norm <- mmu_PHYSI_c1_g1_norm - mmu_PHYSI_c1_g0_norm
hist(delta_PHYSI_c1_norm)
summary(delta_PHYSI_c1_norm)
c(mean(delta_PHYSI_c1_norm),hdi(delta_PHYSI_c1_norm, credMass = 0.95))
hist(mmu_DENT_c1_g0_norm)
summary(mmu_DENT_c1_g0_norm)
hist(mmu_DENT_c1_g1_norm)
summary(mmu_DENT_c1_g1_norm)
delta_DENT_c1_norm <- mmu_DENT_c1_g1_norm - mmu_DENT_c1_g0_norm
hist(delta_DENT_c1_norm)
summary(delta_DENT_c1_norm)
c(mean(delta_DENT_c1_norm),hdi(delta_DENT_c1_norm, credMass = 0.95))
hist(mmu_SOCWORK_c1_g0_norm)
summary(mmu_SOCWORK_c1_g0_norm)
hist(mmu_SOCWORK_c1_g1_norm)
summary(mmu_SOCWORK_c1_g1_norm)
delta_SOCWORK_c1_norm <- mmu_SOCWORK_c1_g1_norm - mmu_SOCWORK_c1_g0_norm
hist(delta_SOCWORK_c1_norm)
summary(delta_SOCWORK_c1_norm)
c(mean(delta_SOCWORK_c1_norm),hdi(delta_SOCWORK_c1_norm, credMass = 0.95))
hist(mmu_COMWORK_c1_g0_norm)
summary(mmu_COMWORK_c1_g0_norm)
hist(mmu_COMWORK_c1_g1_norm)
summary(mmu_COMWORK_c1_g1_norm)
delta_COMWORK_c1_norm <- mmu_COMWORK_c1_g1_norm - mmu_COMWORK_c1_g0_norm
hist(delta_COMWORK_c1_norm)
summary(delta_COMWORK_c1_norm)
c(mean(delta_COMWORK_c1_norm),hdi(delta_COMWORK_c1_norm, credMass = 0.95))
hist(mmu_GP_c1_g0_norm)
summary(mmu_GP_c1_g0_norm)
hist(mmu_GP_c1_g1_norm)
summary(mmu_GP_c1_g1_norm)
delta_GP_c1_norm <- mmu_GP_c1_g1_norm - mmu_GP_c1_g0_norm
hist(delta_GP_c1_norm)
summary(delta_GP_c1_norm)
c(mean(delta_GP_c1_norm),hdi(delta_GP_c1_norm, credMass = 0.95))
hist(mmu_NURSE_c1_g0_norm)
summary(mmu_NURSE_c1_g0_norm)
hist(mmu_NURSE_c1_g1_norm)
summary(mmu_NURSE_c1_g1_norm)
delta_NURSE_c1_norm <- mmu_NURSE_c1_g1_norm - mmu_NURSE_c1_g0_norm
hist(delta_NURSE_c1_norm)
summary(delta_NURSE_c1_norm)
c(mean(delta_NURSE_c1_norm),hdi(delta_NURSE_c1_norm, credMass = 0.95))
hist(mmu_THERAP_c1_g0_norm)
summary(mmu_THERAP_c1_g0_norm)
hist(mmu_THERAP_c1_g1_norm)
summary(mmu_THERAP_c1_g1_norm)
delta_THERAP_c1_norm <- mmu_THERAP_c1_g1_norm - mmu_THERAP_c1_g0_norm
hist(delta_THERAP_c1_norm)
summary(delta_THERAP_c1_norm)
c(mean(delta_THERAP_c1_norm),hdi(delta_THERAP_c1_norm, credMass = 0.95))


hist(mmu_PSYDR_c2_g0_norm)
summary(mmu_PSYDR_c2_g0_norm)
hist(mmu_PSYDR_c2_g1_norm)
summary(mmu_PSYDR_c2_g1_norm)
delta_PSYDR_c2_norm <- mmu_PSYDR_c2_g1_norm - mmu_PSYDR_c2_g0_norm
hist(delta_PSYDR_c2_norm)
summary(delta_PSYDR_c2_norm)
c(mean(delta_PSYDR_c2_norm),hdi(delta_PSYDR_c2_norm, credMass = 0.95))
hist(mmu_PSYCH_c2_g0_norm)
summary(mmu_PSYCH_c2_g0_norm)
hist(mmu_PSYCH_c2_g1_norm)
summary(mmu_PSYCH_c2_g1_norm)
delta_PSYCH_c2_norm <- mmu_PSYCH_c2_g1_norm - mmu_PSYCH_c2_g0_norm
hist(delta_PSYCH_c2_norm)
summary(delta_PSYCH_c2_norm)
c(mean(delta_PSYCH_c2_norm),hdi(delta_PSYCH_c2_norm, credMass = 0.95))
hist(mmu_PHYSI_c2_g0_norm)
summary(mmu_PHYSI_c2_g0_norm)
hist(mmu_PHYSI_c2_g1_norm)
summary(mmu_PHYSI_c2_g1_norm)
delta_PHYSI_c2_norm <- mmu_PHYSI_c2_g1_norm - mmu_PHYSI_c2_g0_norm
hist(delta_PHYSI_c2_norm)
summary(delta_PHYSI_c2_norm)
c(mean(delta_PHYSI_c2_norm),hdi(delta_PHYSI_c2_norm, credMass = 0.95))
hist(mmu_DENT_c2_g0_norm)
summary(mmu_DENT_c2_g0_norm)
hist(mmu_DENT_c2_g1_norm)
summary(mmu_DENT_c2_g1_norm)
delta_DENT_c2_norm <- mmu_DENT_c2_g1_norm - mmu_DENT_c2_g0_norm
hist(delta_DENT_c2_norm)
summary(delta_DENT_c2_norm)
c(mean(delta_DENT_c2_norm),hdi(delta_DENT_c2_norm, credMass = 0.95))
hist(mmu_SOCWORK_c2_g0_norm)
summary(mmu_SOCWORK_c2_g0_norm)
hist(mmu_SOCWORK_c2_g1_norm)
summary(mmu_SOCWORK_c2_g1_norm)
delta_SOCWORK_c2_norm <- mmu_SOCWORK_c2_g1_norm - mmu_SOCWORK_c2_g0_norm
hist(delta_SOCWORK_c2_norm)
summary(delta_SOCWORK_c2_norm)
c(mean(delta_SOCWORK_c2_norm),hdi(delta_SOCWORK_c2_norm, credMass = 0.95))
hist(mmu_COMWORK_c2_g0_norm)
summary(mmu_COMWORK_c2_g0_norm)
hist(mmu_COMWORK_c2_g1_norm)
summary(mmu_COMWORK_c2_g1_norm)
delta_COMWORK_c2_norm <- mmu_COMWORK_c2_g1_norm - mmu_COMWORK_c2_g0_norm
hist(delta_COMWORK_c2_norm)
summary(delta_COMWORK_c2_norm)
c(mean(delta_COMWORK_c2_norm),hdi(delta_COMWORK_c2_norm, credMass = 0.95))
hist(mmu_GP_c2_g0_norm)
summary(mmu_GP_c2_g0_norm)
hist(mmu_GP_c2_g1_norm)
summary(mmu_GP_c2_g1_norm)
delta_GP_c2_norm <- mmu_GP_c2_g1_norm - mmu_GP_c2_g0_norm
hist(delta_GP_c2_norm)
summary(delta_GP_c2_norm)
c(mean(delta_GP_c2_norm),hdi(delta_GP_c2_norm, credMass = 0.95))
hist(mmu_NURSE_c2_g0_norm)
summary(mmu_NURSE_c2_g0_norm)
hist(mmu_NURSE_c2_g1_norm)
summary(mmu_NURSE_c2_g1_norm)
delta_NURSE_c2_norm <- mmu_NURSE_c2_g1_norm - mmu_NURSE_c2_g0_norm
hist(delta_NURSE_c2_norm)
summary(delta_NURSE_c2_norm)
c(mean(delta_NURSE_c2_norm),hdi(delta_NURSE_c2_norm, credMass = 0.95))
hist(mmu_THERAP_c2_g0_norm)
summary(mmu_THERAP_c2_g0_norm)
hist(mmu_THERAP_c2_g1_norm)
summary(mmu_THERAP_c2_g1_norm)
delta_THERAP_c2_norm <- mmu_THERAP_c2_g1_norm - mmu_THERAP_c2_g0_norm
hist(delta_THERAP_c2_norm)
summary(delta_THERAP_c2_norm)
c(mean(delta_THERAP_c2_norm),hdi(delta_THERAP_c2_norm, credMass = 0.95))


hist(mmu_PSYDR_c1_g0_pois)
summary(mmu_PSYDR_c1_g0_pois)
hist(mmu_PSYDR_c1_g1_pois)
summary(mmu_PSYDR_c1_g1_pois)
delta_PSYDR_c1_pois <- mmu_PSYDR_c1_g1_pois - mmu_PSYDR_c1_g0_pois
hist(delta_PSYDR_c1_pois)
summary(delta_PSYDR_c1_pois)
c(mean(delta_PSYDR_c1_pois),hdi(delta_PSYDR_c1_pois, credMass = 0.95))
hist(mmu_PSYCH_c1_g0_pois)
summary(mmu_PSYCH_c1_g0_pois)
hist(mmu_PSYCH_c1_g1_pois)
summary(mmu_PSYCH_c1_g1_pois)
delta_PSYCH_c1_pois <- mmu_PSYCH_c1_g1_pois - mmu_PSYCH_c1_g0_pois
hist(delta_PSYCH_c1_pois)
summary(delta_PSYCH_c1_pois)
c(mean(delta_PSYCH_c1_pois),hdi(delta_PSYCH_c1_pois, credMass = 0.95))
hist(mmu_PHYSI_c1_g0_pois)
summary(mmu_PHYSI_c1_g0_pois)
hist(mmu_PHYSI_c1_g1_pois)
summary(mmu_PHYSI_c1_g1_pois)
delta_PHYSI_c1_pois <- mmu_PHYSI_c1_g1_pois - mmu_PHYSI_c1_g0_pois
hist(delta_PHYSI_c1_pois)
summary(delta_PHYSI_c1_pois)
c(mean(delta_PHYSI_c1_pois),hdi(delta_PHYSI_c1_pois, credMass = 0.95))
hist(mmu_DENT_c1_g0_pois)
summary(mmu_DENT_c1_g0_pois)
hist(mmu_DENT_c1_g1_pois)
summary(mmu_DENT_c1_g1_pois)
delta_DENT_c1_pois <- mmu_DENT_c1_g1_pois - mmu_DENT_c1_g0_pois
hist(delta_DENT_c1_pois)
summary(delta_DENT_c1_pois)
c(mean(delta_DENT_c1_pois),hdi(delta_DENT_c1_pois, credMass = 0.95))
hist(mmu_SOCWORK_c1_g0_pois)
summary(mmu_SOCWORK_c1_g0_pois)
hist(mmu_SOCWORK_c1_g1_pois)
summary(mmu_SOCWORK_c1_g1_pois)
delta_SOCWORK_c1_pois <- mmu_SOCWORK_c1_g1_pois - mmu_SOCWORK_c1_g0_pois
hist(delta_SOCWORK_c1_pois)
summary(delta_SOCWORK_c1_pois)
c(mean(delta_SOCWORK_c1_pois),hdi(delta_SOCWORK_c1_pois, credMass = 0.95))
hist(mmu_COMWORK_c1_g0_pois)
summary(mmu_COMWORK_c1_g0_pois)
hist(mmu_COMWORK_c1_g1_pois)
summary(mmu_COMWORK_c1_g1_pois)
delta_COMWORK_c1_pois <- mmu_COMWORK_c1_g1_pois - mmu_COMWORK_c1_g0_pois
hist(delta_COMWORK_c1_pois)
summary(delta_COMWORK_c1_pois)
c(mean(delta_COMWORK_c1_pois),hdi(delta_COMWORK_c1_pois, credMass = 0.95))
hist(mmu_GP_c1_g0_pois)
summary(mmu_GP_c1_g0_pois)
hist(mmu_GP_c1_g1_pois)
summary(mmu_GP_c1_g1_pois)
delta_GP_c1_pois <- mmu_GP_c1_g1_pois - mmu_GP_c1_g0_pois
hist(delta_GP_c1_pois)
summary(delta_GP_c1_pois)
c(mean(delta_GP_c1_pois),hdi(delta_GP_c1_pois, credMass = 0.95))
hist(mmu_NURSE_c1_g0_pois)
summary(mmu_NURSE_c1_g0_pois)
hist(mmu_NURSE_c1_g1_pois)
summary(mmu_NURSE_c1_g1_pois)
delta_NURSE_c1_pois <- mmu_NURSE_c1_g1_pois - mmu_NURSE_c1_g0_pois
hist(delta_NURSE_c1_pois)
summary(delta_NURSE_c1_pois)
c(mean(delta_NURSE_c1_pois),hdi(delta_NURSE_c1_pois, credMass = 0.95))
hist(mmu_THERAP_c1_g0_pois)
summary(mmu_THERAP_c1_g0_pois)
hist(mmu_THERAP_c1_g1_pois)
summary(mmu_THERAP_c1_g1_pois)
delta_THERAP_c1_pois <- mmu_THERAP_c1_g1_pois - mmu_THERAP_c1_g0_pois
hist(delta_THERAP_c1_pois)
summary(delta_THERAP_c1_pois)
c(mean(delta_THERAP_c1_pois),hdi(delta_THERAP_c1_pois, credMass = 0.95))


hist(mmu_PSYDR_c2_g0_pois)
summary(mmu_PSYDR_c2_g0_pois)
hist(mmu_PSYDR_c2_g1_pois)
summary(mmu_PSYDR_c2_g1_pois)
delta_PSYDR_c2_pois <- mmu_PSYDR_c2_g1_pois - mmu_PSYDR_c2_g0_pois
hist(delta_PSYDR_c2_pois)
summary(delta_PSYDR_c2_pois)
c(mean(delta_PSYDR_c2_pois),hdi(delta_PSYDR_c2_pois, credMass = 0.95))
hist(mmu_PSYCH_c2_g0_pois)
summary(mmu_PSYCH_c2_g0_pois)
hist(mmu_PSYCH_c2_g1_pois)
summary(mmu_PSYCH_c2_g1_pois)
delta_PSYCH_c2_pois <- mmu_PSYCH_c2_g1_pois - mmu_PSYCH_c2_g0_pois
hist(delta_PSYCH_c2_pois)
summary(delta_PSYCH_c2_pois)
c(mean(delta_PSYCH_c2_pois),hdi(delta_PSYCH_c2_pois, credMass = 0.95))
hist(mmu_PHYSI_c2_g0_pois)
summary(mmu_PHYSI_c2_g0_pois)
hist(mmu_PHYSI_c2_g1_pois)
summary(mmu_PHYSI_c2_g1_pois)
delta_PHYSI_c2_pois <- mmu_PHYSI_c2_g1_pois - mmu_PHYSI_c2_g0_pois
hist(delta_PHYSI_c2_pois)
summary(delta_PHYSI_c2_pois)
c(mean(delta_PHYSI_c2_pois),hdi(delta_PHYSI_c2_pois, credMass = 0.95))
hist(mmu_DENT_c2_g0_pois)
summary(mmu_DENT_c2_g0_pois)
hist(mmu_DENT_c2_g1_pois)
summary(mmu_DENT_c2_g1_pois)
delta_DENT_c2_pois <- mmu_DENT_c2_g1_pois - mmu_DENT_c2_g0_pois
hist(delta_DENT_c2_pois)
summary(delta_DENT_c2_pois)
c(mean(delta_DENT_c2_pois),hdi(delta_DENT_c2_pois, credMass = 0.95))
hist(mmu_SOCWORK_c2_g0_pois)
summary(mmu_SOCWORK_c2_g0_pois)
hist(mmu_SOCWORK_c2_g1_pois)
summary(mmu_SOCWORK_c2_g1_pois)
delta_SOCWORK_c2_pois <- mmu_SOCWORK_c2_g1_pois - mmu_SOCWORK_c2_g0_pois
hist(delta_SOCWORK_c2_pois)
summary(delta_SOCWORK_c2_pois)
c(mean(delta_SOCWORK_c2_pois),hdi(delta_SOCWORK_c2_pois, credMass = 0.95))
hist(mmu_COMWORK_c2_g0_pois)
summary(mmu_COMWORK_c2_g0_pois)
hist(mmu_COMWORK_c2_g1_pois)
summary(mmu_COMWORK_c2_g1_pois)
delta_COMWORK_c2_pois <- mmu_COMWORK_c2_g1_pois - mmu_COMWORK_c2_g0_pois
hist(delta_COMWORK_c2_pois)
summary(delta_COMWORK_c2_pois)
c(mean(delta_COMWORK_c2_pois),hdi(delta_COMWORK_c2_pois, credMass = 0.95))
hist(mmu_GP_c2_g0_pois)
summary(mmu_GP_c2_g0_pois)
hist(mmu_GP_c2_g1_pois)
summary(mmu_GP_c2_g1_pois)
delta_GP_c2_pois <- mmu_GP_c2_g1_pois - mmu_GP_c2_g0_pois
hist(delta_GP_c2_pois)
summary(delta_GP_c2_pois)
c(mean(delta_GP_c2_pois),hdi(delta_GP_c2_pois, credMass = 0.95))
hist(mmu_NURSE_c2_g0_pois)
summary(mmu_NURSE_c2_g0_pois)
hist(mmu_NURSE_c2_g1_pois)
summary(mmu_NURSE_c2_g1_pois)
delta_NURSE_c2_pois <- mmu_NURSE_c2_g1_pois - mmu_NURSE_c2_g0_pois
hist(delta_NURSE_c2_pois)
summary(delta_NURSE_c2_pois)
c(mean(delta_NURSE_c2_pois),hdi(delta_NURSE_c2_pois, credMass = 0.95))
hist(mmu_THERAP_c2_g0_pois)
summary(mmu_THERAP_c2_g0_pois)
hist(mmu_THERAP_c2_g1_pois)
summary(mmu_THERAP_c2_g1_pois)
delta_THERAP_c2_pois <- mmu_THERAP_c2_g1_pois - mmu_THERAP_c2_g0_pois
hist(delta_THERAP_c2_pois)
summary(delta_THERAP_c2_pois)
c(mean(delta_THERAP_c2_pois),hdi(delta_THERAP_c2_pois, credMass = 0.95))



hist(mmu_PSYDR_c1_g0_nbinom)
summary(mmu_PSYDR_c1_g0_nbinom)
hist(mmu_PSYDR_c1_g1_nbinom)
summary(mmu_PSYDR_c1_g1_nbinom)
delta_PSYDR_c1_nbinom <- mmu_PSYDR_c1_g1_nbinom - mmu_PSYDR_c1_g0_nbinom
hist(delta_PSYDR_c1_nbinom)
summary(delta_PSYDR_c1_nbinom)
c(mean(delta_PSYDR_c1_nbinom),hdi(delta_PSYDR_c1_nbinom, credMass = 0.95))
hist(mmu_PSYCH_c1_g0_nbinom)
summary(mmu_PSYCH_c1_g0_nbinom)
hist(mmu_PSYCH_c1_g1_nbinom)
summary(mmu_PSYCH_c1_g1_nbinom)
delta_PSYCH_c1_nbinom <- mmu_PSYCH_c1_g1_nbinom - mmu_PSYCH_c1_g0_nbinom
hist(delta_PSYCH_c1_nbinom)
summary(delta_PSYCH_c1_nbinom)
c(mean(delta_PSYCH_c1_nbinom),hdi(delta_PSYCH_c1_nbinom, credMass = 0.95))
hist(mmu_PHYSI_c1_g0_nbinom)
summary(mmu_PHYSI_c1_g0_nbinom)
hist(mmu_PHYSI_c1_g1_nbinom)
summary(mmu_PHYSI_c1_g1_nbinom)
delta_PHYSI_c1_nbinom <- mmu_PHYSI_c1_g1_nbinom - mmu_PHYSI_c1_g0_nbinom
hist(delta_PHYSI_c1_nbinom)
summary(delta_PHYSI_c1_nbinom)
c(mean(delta_PHYSI_c1_nbinom),hdi(delta_PHYSI_c1_nbinom, credMass = 0.95))
hist(mmu_DENT_c1_g0_nbinom)
summary(mmu_DENT_c1_g0_nbinom)
hist(mmu_DENT_c1_g1_nbinom)
summary(mmu_DENT_c1_g1_nbinom)
delta_DENT_c1_nbinom <- mmu_DENT_c1_g1_nbinom - mmu_DENT_c1_g0_nbinom
hist(delta_DENT_c1_nbinom)
summary(delta_DENT_c1_nbinom)
c(mean(delta_DENT_c1_nbinom),hdi(delta_DENT_c1_nbinom, credMass = 0.95))
hist(mmu_SOCWORK_c1_g0_nbinom)
summary(mmu_SOCWORK_c1_g0_nbinom)
hist(mmu_SOCWORK_c1_g1_nbinom)
summary(mmu_SOCWORK_c1_g1_nbinom)
delta_SOCWORK_c1_nbinom <- mmu_SOCWORK_c1_g1_nbinom - mmu_SOCWORK_c1_g0_nbinom
hist(delta_SOCWORK_c1_nbinom)
summary(delta_SOCWORK_c1_nbinom)
c(mean(delta_SOCWORK_c1_nbinom),hdi(delta_SOCWORK_c1_nbinom, credMass = 0.95))
hist(mmu_COMWORK_c1_g0_nbinom)
summary(mmu_COMWORK_c1_g0_nbinom)
hist(mmu_COMWORK_c1_g1_nbinom)
summary(mmu_COMWORK_c1_g1_nbinom)
delta_COMWORK_c1_nbinom <- mmu_COMWORK_c1_g1_nbinom - mmu_COMWORK_c1_g0_nbinom
hist(delta_COMWORK_c1_nbinom)
summary(delta_COMWORK_c1_nbinom)
c(mean(delta_COMWORK_c1_nbinom),hdi(delta_COMWORK_c1_nbinom, credMass = 0.95))
hist(mmu_GP_c1_g0_nbinom)
summary(mmu_GP_c1_g0_nbinom)
hist(mmu_GP_c1_g1_nbinom)
summary(mmu_GP_c1_g1_nbinom)
delta_GP_c1_nbinom <- mmu_GP_c1_g1_nbinom - mmu_GP_c1_g0_nbinom
hist(delta_GP_c1_nbinom)
summary(delta_GP_c1_nbinom)
c(mean(delta_GP_c1_nbinom),hdi(delta_GP_c1_nbinom, credMass = 0.95))
hist(mmu_NURSE_c1_g0_nbinom)
summary(mmu_NURSE_c1_g0_nbinom)
hist(mmu_NURSE_c1_g1_nbinom)
summary(mmu_NURSE_c1_g1_nbinom)
delta_NURSE_c1_nbinom <- mmu_NURSE_c1_g1_nbinom - mmu_NURSE_c1_g0_nbinom
hist(delta_NURSE_c1_nbinom)
summary(delta_NURSE_c1_nbinom)
c(mean(delta_NURSE_c1_nbinom),hdi(delta_NURSE_c1_nbinom, credMass = 0.95))
hist(mmu_THERAP_c1_g0_nbinom)
summary(mmu_THERAP_c1_g0_nbinom)
hist(mmu_THERAP_c1_g1_nbinom)
summary(mmu_THERAP_c1_g1_nbinom)
delta_THERAP_c1_nbinom <- mmu_THERAP_c1_g1_nbinom - mmu_THERAP_c1_g0_nbinom
hist(delta_THERAP_c1_nbinom)
summary(delta_THERAP_c1_nbinom)
c(mean(delta_THERAP_c1_nbinom),hdi(delta_THERAP_c1_nbinom, credMass = 0.95))


hist(mmu_PSYDR_c2_g0_nbinom)
summary(mmu_PSYDR_c2_g0_nbinom)
hist(mmu_PSYDR_c2_g1_nbinom)
summary(mmu_PSYDR_c2_g1_nbinom)
delta_PSYDR_c2_nbinom <- mmu_PSYDR_c2_g1_nbinom - mmu_PSYDR_c2_g0_nbinom
hist(delta_PSYDR_c2_nbinom)
summary(delta_PSYDR_c2_nbinom)
c(mean(delta_PSYDR_c2_nbinom),hdi(delta_PSYDR_c2_nbinom, credMass = 0.95))
hist(mmu_PSYCH_c2_g0_nbinom)
summary(mmu_PSYCH_c2_g0_nbinom)
hist(mmu_PSYCH_c2_g1_nbinom)
summary(mmu_PSYCH_c2_g1_nbinom)
delta_PSYCH_c2_nbinom <- mmu_PSYCH_c2_g1_nbinom - mmu_PSYCH_c2_g0_nbinom
hist(delta_PSYCH_c2_nbinom)
summary(delta_PSYCH_c2_nbinom)
c(mean(delta_PSYCH_c2_nbinom),hdi(delta_PSYCH_c2_nbinom, credMass = 0.95))
hist(mmu_PHYSI_c2_g0_nbinom)
summary(mmu_PHYSI_c2_g0_nbinom)
hist(mmu_PHYSI_c2_g1_nbinom)
summary(mmu_PHYSI_c2_g1_nbinom)
delta_PHYSI_c2_nbinom <- mmu_PHYSI_c2_g1_nbinom - mmu_PHYSI_c2_g0_nbinom
hist(delta_PHYSI_c2_nbinom)
summary(delta_PHYSI_c2_nbinom)
c(mean(delta_PHYSI_c2_nbinom),hdi(delta_PHYSI_c2_nbinom, credMass = 0.95))
hist(mmu_DENT_c2_g0_nbinom)
summary(mmu_DENT_c2_g0_nbinom)
hist(mmu_DENT_c2_g1_nbinom)
summary(mmu_DENT_c2_g1_nbinom)
delta_DENT_c2_nbinom <- mmu_DENT_c2_g1_nbinom - mmu_DENT_c2_g0_nbinom
hist(delta_DENT_c2_nbinom)
summary(delta_DENT_c2_nbinom)
c(mean(delta_DENT_c2_nbinom),hdi(delta_DENT_c2_nbinom, credMass = 0.95))
hist(mmu_SOCWORK_c2_g0_nbinom)
summary(mmu_SOCWORK_c2_g0_nbinom)
hist(mmu_SOCWORK_c2_g1_nbinom)
summary(mmu_SOCWORK_c2_g1_nbinom)
delta_SOCWORK_c2_nbinom <- mmu_SOCWORK_c2_g1_nbinom - mmu_SOCWORK_c2_g0_nbinom
hist(delta_SOCWORK_c2_nbinom)
summary(delta_SOCWORK_c2_nbinom)
c(mean(delta_SOCWORK_c2_nbinom),hdi(delta_SOCWORK_c2_nbinom, credMass = 0.95))
hist(mmu_COMWORK_c2_g0_nbinom)
summary(mmu_COMWORK_c2_g0_nbinom)
hist(mmu_COMWORK_c2_g1_nbinom)
summary(mmu_COMWORK_c2_g1_nbinom)
delta_COMWORK_c2_nbinom <- mmu_COMWORK_c2_g1_nbinom - mmu_COMWORK_c2_g0_nbinom
hist(delta_COMWORK_c2_nbinom)
summary(delta_COMWORK_c2_nbinom)
c(mean(delta_COMWORK_c2_nbinom),hdi(delta_COMWORK_c2_nbinom, credMass = 0.95))
hist(mmu_GP_c2_g0_nbinom)
summary(mmu_GP_c2_g0_nbinom)
hist(mmu_GP_c2_g1_nbinom)
summary(mmu_GP_c2_g1_nbinom)
delta_GP_c2_nbinom <- mmu_GP_c2_g1_nbinom - mmu_GP_c2_g0_nbinom
hist(delta_GP_c2_nbinom)
summary(delta_GP_c2_nbinom)
c(mean(delta_GP_c2_nbinom),hdi(delta_GP_c2_nbinom, credMass = 0.95))
hist(mmu_NURSE_c2_g0_nbinom)
summary(mmu_NURSE_c2_g0_nbinom)
hist(mmu_NURSE_c2_g1_nbinom)
summary(mmu_NURSE_c2_g1_nbinom)
delta_NURSE_c2_nbinom <- mmu_NURSE_c2_g1_nbinom - mmu_NURSE_c2_g0_nbinom
hist(delta_NURSE_c2_nbinom)
summary(delta_NURSE_c2_nbinom)
c(mean(delta_NURSE_c2_nbinom),hdi(delta_NURSE_c2_nbinom, credMass = 0.95))
hist(mmu_THERAP_c2_g0_nbinom)
summary(mmu_THERAP_c2_g0_nbinom)
hist(mmu_THERAP_c2_g1_nbinom)
summary(mmu_THERAP_c2_g1_nbinom)
delta_THERAP_c2_nbinom <- mmu_THERAP_c2_g1_nbinom - mmu_THERAP_c2_g0_nbinom
hist(delta_THERAP_c2_nbinom)
summary(delta_THERAP_c2_nbinom)
c(mean(delta_THERAP_c2_nbinom),hdi(delta_THERAP_c2_nbinom, credMass = 0.95))


#summarise results between groups for costs at each time
library(HDInterval)
hist(mmu_all1_tc_g0_norm)
summary(mmu_all1_tc_g0_norm)
c(mean(mmu_all1_tc_g0_norm),hdi(mmu_all1_tc_g0_norm, credMass = 0.95))
hist(mmu_all1_tc_g1_norm)
summary(mmu_all1_tc_g1_norm)
c(mean(mmu_all1_tc_g1_norm),hdi(mmu_all1_tc_g1_norm, credMass = 0.95))
delta_all1_tc_norm <- mmu_all1_tc_g1_norm - mmu_all1_tc_g0_norm
hist(delta_all1_tc_norm)
summary(delta_all1_tc_norm)
c(mean(delta_all1_tc_norm),hdi(delta_all1_tc_norm, credMass = 0.95))
hist(mmu_all2_tc_g0_norm)
summary(mmu_all2_tc_g0_norm)
c(mean(mmu_all2_tc_g0_norm),hdi(mmu_all2_tc_g0_norm, credMass = 0.95))
hist(mmu_all2_tc_g1_norm)
summary(mmu_all2_tc_g1_norm)
c(mean(mmu_all2_tc_g1_norm),hdi(mmu_all2_tc_g1_norm, credMass = 0.95))
delta_all2_tc_norm <- mmu_all2_tc_g1_norm - mmu_all2_tc_g0_norm
hist(delta_all2_tc_norm)
summary(delta_all2_tc_norm)
c(mean(delta_all2_tc_norm),hdi(delta_all2_tc_norm, credMass = 0.95))


hist(mmu_all1_tc_g0_pois)
summary(mmu_all1_tc_g0_pois)
hist(mmu_all1_tc_g1_pois)
summary(mmu_all1_tc_g1_pois)
delta_all1_tc_pois <- mmu_all1_tc_g1_pois - mmu_all1_tc_g0_pois
hist(delta_all1_tc_pois)
summary(delta_all1_tc_pois)
c(mean(delta_all1_tc_pois),hdi(delta_all1_tc_pois, credMass = 0.95))
hist(mmu_all2_tc_g0_pois)
summary(mmu_all2_tc_g0_pois)
hist(mmu_all2_tc_g1_pois)
summary(mmu_all2_tc_g1_pois)
delta_all2_tc_pois <- mmu_all2_tc_g1_pois - mmu_all2_tc_g0_pois
hist(delta_all2_tc_pois)
summary(delta_all2_tc_pois)
c(mean(delta_all2_tc_pois),hdi(delta_all2_tc_pois, credMass = 0.95))


hist(mmu_all1_tc_g0_nbinom)
summary(mmu_all1_tc_g0_nbinom)
hist(mmu_all1_tc_g1_nbinom)
summary(mmu_all1_tc_g1_nbinom)
delta_all1_tc_nbinom <- mmu_all1_tc_g1_nbinom - mmu_all1_tc_g0_nbinom
hist(delta_all1_tc_nbinom)
summary(delta_all1_tc_nbinom)
c(mean(delta_all1_tc_nbinom),hdi(delta_all1_tc_nbinom, credMass = 0.95))
hist(mmu_all2_tc_g0_nbinom)
summary(mmu_all2_tc_g0_nbinom)
hist(mmu_all2_tc_g1_nbinom)
summary(mmu_all2_tc_g1_nbinom)
delta_all2_tc_nbinom <- mmu_all2_tc_g1_nbinom - mmu_all2_tc_g0_nbinom
hist(delta_all2_tc_nbinom)
summary(delta_all2_tc_nbinom)
c(mean(delta_all2_tc_nbinom),hdi(delta_all2_tc_nbinom, credMass = 0.95))


#summarise results between groups for total costs
library(HDInterval)
hist(mmu_all_tc_g0_norm)
summary(mmu_all_tc_g0_norm)
c(mean(mmu_all_tc_g0_norm),hdi(mmu_all_tc_g0_norm, credMass = 0.95))
hist(mmu_all_tc_g1_norm)
summary(mmu_all_tc_g1_norm)
c(mean(mmu_all_tc_g1_norm),hdi(mmu_all_tc_g1_norm, credMass = 0.95))
delta_tc_norm <- mmu_all_tc_g1_norm - mmu_all_tc_g0_norm
hist(delta_tc_norm)
summary(delta_tc_norm)
c(mean(delta_tc_norm),hdi(delta_tc_norm, credMass = 0.95))

hist(mmu_all_tc_g0_pois)
summary(mmu_all_tc_g0_pois)
hist(mmu_all_tc_g1_pois)
summary(mmu_all_tc_g1_pois)
delta_tc_pois <- mmu_all_tc_g1_pois - mmu_all_tc_g0_pois
hist(delta_tc_pois)
summary(delta_tc_pois)
c(mean(delta_tc_pois),hdi(delta_tc_pois, credMass = 0.95))

hist(mmu_all_tc_g0_nbinom)
summary(mmu_all_tc_g0_nbinom)
hist(mmu_all_tc_g1_nbinom)
summary(mmu_all_tc_g1_nbinom)
delta_tc_nbinom <- mmu_all_tc_g1_nbinom - mmu_all_tc_g0_nbinom
hist(delta_tc_nbinom)
summary(delta_tc_nbinom)
c(mean(delta_tc_nbinom),hdi(delta_tc_nbinom, credMass = 0.95))


#RESULTS - MODEL LEVEL OF U/HRU
#load results and extract estimates
library(HDInterval)
res_s3_method1 <- readRDS("res_s3_method1.rds")

#m1 = no imputation of NA at the HRU level
#amount missing resulting in c
summary(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR0)
summary(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR1)
summary(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR2)
summary(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH0)
summary(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH1)
summary(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH2)
summary(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI0)
summary(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI1)
summary(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI2)
summary(PBS_dataset_quest_cc_hru_AD$HRU_DENT0)
summary(PBS_dataset_quest_cc_hru_AD$HRU_DENT1)
summary(PBS_dataset_quest_cc_hru_AD$HRU_DENT2)
summary(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK0)
summary(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK1)
summary(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK2)
summary(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK0)
summary(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK1)
summary(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK2)
summary(PBS_dataset_quest_cc_hru_AD$HRU_GP0)
summary(PBS_dataset_quest_cc_hru_AD$HRU_GP1)
summary(PBS_dataset_quest_cc_hru_AD$HRU_GP2)
summary(PBS_dataset_quest_cc_hru_AD$HRU_NURSE0)
summary(PBS_dataset_quest_cc_hru_AD$HRU_NURSE1)
summary(PBS_dataset_quest_cc_hru_AD$HRU_NURSE2)
summary(PBS_dataset_quest_cc_hru_AD$HRU_THERAP0)
summary(PBS_dataset_quest_cc_hru_AD$HRU_THERAP1)
summary(PBS_dataset_quest_cc_hru_AD$HRU_THERAP2)

#check empirical distributions of HRU data by arm
hist(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR0[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR0[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR0[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR0[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR0~PBS_dataset_quest_cc_hru_AD$group)
hist(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR1[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR1[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR1[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR1[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR1~PBS_dataset_quest_cc_hru_AD$group)
hist(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR2[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR2[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR2[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR2[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_PSYDR2~PBS_dataset_quest_cc_hru_AD$group)

hist(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH0[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH0[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH0[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH0[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH0~PBS_dataset_quest_cc_hru_AD$group)
hist(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH1[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH1[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH1[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH1[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH1~PBS_dataset_quest_cc_hru_AD$group)
hist(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH2[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH2[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH2[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH2[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_PSYCH2~PBS_dataset_quest_cc_hru_AD$group)

hist(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI0[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI0[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI0[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI0[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI0~PBS_dataset_quest_cc_hru_AD$group)
hist(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI1[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI1[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI1[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI1[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI1~PBS_dataset_quest_cc_hru_AD$group)
hist(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI2[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI2[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI2[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI2[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_PHYSI2~PBS_dataset_quest_cc_hru_AD$group)

hist(PBS_dataset_quest_cc_hru_AD$HRU_DENT0[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_DENT0[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_DENT0[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_DENT0[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_DENT0~PBS_dataset_quest_cc_hru_AD$group)
hist(PBS_dataset_quest_cc_hru_AD$HRU_DENT1[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_DENT1[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_DENT1[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_DENT1[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_DENT1~PBS_dataset_quest_cc_hru_AD$group)
hist(PBS_dataset_quest_cc_hru_AD$HRU_DENT2[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_DENT2[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_DENT2[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_DENT2[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_DENT2~PBS_dataset_quest_cc_hru_AD$group)

hist(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK0[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK0[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK0[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK0[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK0~PBS_dataset_quest_cc_hru_AD$group)
hist(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK1[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK1[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK1[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK1[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK1~PBS_dataset_quest_cc_hru_AD$group)
hist(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK2[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK2[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK2[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK2[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_SOCWORK2~PBS_dataset_quest_cc_hru_AD$group)

hist(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK0[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK0[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK0[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK0[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK0~PBS_dataset_quest_cc_hru_AD$group)
hist(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK1[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK1[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK1[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK1[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK1~PBS_dataset_quest_cc_hru_AD$group)
hist(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK2[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK2[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK2[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK2[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_COMWORK2~PBS_dataset_quest_cc_hru_AD$group)

hist(PBS_dataset_quest_cc_hru_AD$HRU_GP0[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_GP0[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_GP0[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_GP0[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_GP0~PBS_dataset_quest_cc_hru_AD$group)
hist(PBS_dataset_quest_cc_hru_AD$HRU_GP1[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_GP1[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_GP1[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_GP1[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_GP1~PBS_dataset_quest_cc_hru_AD$group)
hist(PBS_dataset_quest_cc_hru_AD$HRU_GP2[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_GP2[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_GP2[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_GP2[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_GP2~PBS_dataset_quest_cc_hru_AD$group)

hist(PBS_dataset_quest_cc_hru_AD$HRU_NURSE0[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_NURSE0[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_NURSE0[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_NURSE0[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_NURSE0~PBS_dataset_quest_cc_hru_AD$group)
hist(PBS_dataset_quest_cc_hru_AD$HRU_NURSE1[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_NURSE1[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_NURSE1[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_NURSE1[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_NURSE1~PBS_dataset_quest_cc_hru_AD$group)
hist(PBS_dataset_quest_cc_hru_AD$HRU_NURSE2[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_NURSE2[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_NURSE2[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_NURSE2[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_NURSE2~PBS_dataset_quest_cc_hru_AD$group)

hist(PBS_dataset_quest_cc_hru_AD$HRU_THERAP0[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_THERAP0[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_THERAP0[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_THERAP0[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_THERAP0~PBS_dataset_quest_cc_hru_AD$group)
hist(PBS_dataset_quest_cc_hru_AD$HRU_THERAP1[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_THERAP1[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_THERAP1[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_THERAP1[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_THERAP1~PBS_dataset_quest_cc_hru_AD$group)
hist(PBS_dataset_quest_cc_hru_AD$HRU_THERAP2[PBS_dataset_quest_cc_hru_AD$group==0])
hist(PBS_dataset_quest_cc_hru_AD$HRU_THERAP2[PBS_dataset_quest_cc_hru_AD$group==1])
summary(PBS_dataset_quest_cc_hru_AD$HRU_THERAP2[PBS_dataset_quest_cc_hru_AD$group==0])
summary(PBS_dataset_quest_cc_hru_AD$HRU_THERAP2[PBS_dataset_quest_cc_hru_AD$group==1])
boxplot(PBS_dataset_quest_cc_hru_AD$HRU_THERAP2~PBS_dataset_quest_cc_hru_AD$group)


s3m1_mu_psydr0t1_pois <- res_s3_method1$res_s2_method1_pois$mmu_PSYDR1_g0_pois
s3m1_mu_psydr1t1_pois <- res_s3_method1$res_s2_method1_pois$mmu_PSYDR1_g1_pois
s3m1_mu_psydr0t2_pois <- res_s3_method1$res_s2_method1_pois$mmu_PSYDR2_g0_pois
s3m1_mu_psydr1t2_pois <- res_s3_method1$res_s2_method1_pois$mmu_PSYDR2_g1_pois
s3m1_mu_psych0t1_pois <- res_s3_method1$res_s2_method1_pois$mmu_PSYCH1_g0_pois
s3m1_mu_psych1t1_pois <- res_s3_method1$res_s2_method1_pois$mmu_PSYCH1_g1_pois
s3m1_mu_psych0t2_pois <- res_s3_method1$res_s2_method1_pois$mmu_PSYCH2_g0_pois
s3m1_mu_psych1t2_pois <- res_s3_method1$res_s2_method1_pois$mmu_PSYCH2_g1_pois
s3m1_mu_physi0t1_pois <- res_s3_method1$res_s2_method1_pois$mmu_PHYSI1_g0_pois
s3m1_mu_physi1t1_pois <- res_s3_method1$res_s2_method1_pois$mmu_PHYSI1_g1_pois
s3m1_mu_physi0t2_pois <- res_s3_method1$res_s2_method1_pois$mmu_PHYSI2_g0_pois
s3m1_mu_physi1t2_pois <- res_s3_method1$res_s2_method1_pois$mmu_PHYSI2_g1_pois
s3m1_mu_dent0t1_pois <- res_s3_method1$res_s2_method1_pois$mmu_DENT1_g0_pois
s3m1_mu_dent1t1_pois <- res_s3_method1$res_s2_method1_pois$mmu_DENT1_g1_pois
s3m1_mu_dent0t2_pois <- res_s3_method1$res_s2_method1_pois$mmu_DENT2_g0_pois
s3m1_mu_dent1t2_pois <- res_s3_method1$res_s2_method1_pois$mmu_DENT2_g1_pois
s3m1_mu_socwork0t1_pois <- res_s3_method1$res_s2_method1_pois$mmu_SOCWORK1_g0_pois
s3m1_mu_socwork1t1_pois <- res_s3_method1$res_s2_method1_pois$mmu_SOCWORK1_g1_pois
s3m1_mu_socwork0t2_pois <- res_s3_method1$res_s2_method1_pois$mmu_SOCWORK2_g0_pois
s3m1_mu_socwork1t2_pois <- res_s3_method1$res_s2_method1_pois$mmu_SOCWORK2_g1_pois
s3m1_mu_comwork0t1_pois <- res_s3_method1$res_s2_method1_pois$mmu_COMWORK1_g0_pois
s3m1_mu_comwork1t1_pois <- res_s3_method1$res_s2_method1_pois$mmu_COMWORK1_g1_pois
s3m1_mu_comwork0t2_pois <- res_s3_method1$res_s2_method1_pois$mmu_COMWORK2_g0_pois
s3m1_mu_comwork1t2_pois <- res_s3_method1$res_s2_method1_pois$mmu_COMWORK2_g1_pois
s3m1_mu_gp0t1_pois <- res_s3_method1$res_s2_method1_pois$mmu_GP1_g0_pois
s3m1_mu_gp1t1_pois <- res_s3_method1$res_s2_method1_pois$mmu_GP1_g1_pois
s3m1_mu_gp0t2_pois <- res_s3_method1$res_s2_method1_pois$mmu_GP2_g0_pois
s3m1_mu_gp1t2_pois <- res_s3_method1$res_s2_method1_pois$mmu_GP2_g1_pois
s3m1_mu_nurse0t1_pois <- res_s3_method1$res_s2_method1_pois$mmu_NURSE1_g0_pois
s3m1_mu_nurse1t1_pois <- res_s3_method1$res_s2_method1_pois$mmu_NURSE1_g1_pois
s3m1_mu_nurse0t2_pois <- res_s3_method1$res_s2_method1_pois$mmu_NURSE2_g0_pois
s3m1_mu_nurse1t2_pois <- res_s3_method1$res_s2_method1_pois$mmu_NURSE2_g1_pois
s3m1_mu_therap0t1_pois <- res_s3_method1$res_s2_method1_pois$mmu_THERAP1_g0_pois
s3m1_mu_therap1t1_pois <- res_s3_method1$res_s2_method1_pois$mmu_THERAP1_g1_pois
s3m1_mu_therap0t2_pois <- res_s3_method1$res_s2_method1_pois$mmu_THERAP2_g0_pois
s3m1_mu_therap1t2_pois <- res_s3_method1$res_s2_method1_pois$mmu_THERAP2_g1_pois

s3m1_mu_c0t1_pois <- s3m1_mu_psydr0t1_pois*39 + s3m1_mu_psych0t1_pois*52 + s3m1_mu_physi0t1_pois*52 +
  s3m1_mu_dent0t1_pois*71 + s3m1_mu_socwork0t1_pois*55 + s3m1_mu_comwork0t1_pois*51 + s3m1_mu_gp0t1_pois*40.33333 +
  s3m1_mu_nurse0t1_pois*24.66667 + s3m1_mu_therap0t1_pois*67.5
s3m1_mu_c1t1_pois <- s3m1_mu_psydr1t1_pois*39 + s3m1_mu_psych1t1_pois*52 + s3m1_mu_physi1t1_pois*52 +
  s3m1_mu_dent1t1_pois*71 + s3m1_mu_socwork1t1_pois*55 + s3m1_mu_comwork1t1_pois*51 + s3m1_mu_gp1t1_pois*40.33333 +
  s3m1_mu_nurse1t1_pois*24.66667 + s3m1_mu_therap1t1_pois*67.5
s3m1_mu_c0t2_pois <- s3m1_mu_psydr0t2_pois*39 + s3m1_mu_psych0t2_pois*52 + s3m1_mu_physi0t2_pois*52 +
  s3m1_mu_dent0t2_pois*71 + s3m1_mu_socwork0t2_pois*55 + s3m1_mu_comwork0t2_pois*51 + s3m1_mu_gp0t2_pois*40.33333 +
  s3m1_mu_nurse0t2_pois*24.66667 + s3m1_mu_therap0t2_pois*67.5
s3m1_mu_c1t2_pois <- s3m1_mu_psydr1t2_pois*39 + s3m1_mu_psych1t2_pois*52 + s3m1_mu_physi1t2_pois*52 +
  s3m1_mu_dent1t2_pois*71 + s3m1_mu_socwork1t2_pois*55 + s3m1_mu_comwork1t2_pois*51 + s3m1_mu_gp1t2_pois*40.33333 +
  s3m1_mu_nurse1t2_pois*24.66667 + s3m1_mu_therap1t2_pois*67.5
s3m1_mu_tc0_pois <- s3m1_mu_c0t1_pois + s3m1_mu_c0t2_pois
s3m1_mu_tc1_pois <- s3m1_mu_c1t1_pois + s3m1_mu_c1t2_pois
s3m1_delta_tc_pois <- s3m1_mu_tc1_pois - s3m1_mu_tc0_pois


c(mean(s3m1_mu_psydr0t1_pois),hdi(s3m1_mu_psydr0t1_pois, credMass = 0.95))
c(mean(s3m1_mu_psydr0t2_pois),hdi(s3m1_mu_psydr0t2_pois, credMass = 0.95))
c(mean(s3m1_mu_psydr1t1_pois),hdi(s3m1_mu_psydr1t1_pois, credMass = 0.95))
c(mean(s3m1_mu_psydr1t2_pois),hdi(s3m1_mu_psydr1t2_pois, credMass = 0.95))

c(mean(s3m1_mu_psych0t1_pois),hdi(s3m1_mu_psych0t1_pois, credMass = 0.95))
c(mean(s3m1_mu_psych0t2_pois),hdi(s3m1_mu_psych0t2_pois, credMass = 0.95))
c(mean(s3m1_mu_psych1t1_pois),hdi(s3m1_mu_psych1t1_pois, credMass = 0.95))
c(mean(s3m1_mu_psych1t2_pois),hdi(s3m1_mu_psych1t2_pois, credMass = 0.95))

c(mean(s3m1_mu_physi0t1_pois),hdi(s3m1_mu_physi0t1_pois, credMass = 0.95))
c(mean(s3m1_mu_physi0t2_pois),hdi(s3m1_mu_physi0t2_pois, credMass = 0.95))
c(mean(s3m1_mu_physi1t1_pois),hdi(s3m1_mu_physi1t2_pois, credMass = 0.95))
c(mean(s3m1_mu_physi1t2_pois),hdi(s3m1_mu_physi1t2_pois, credMass = 0.95))

c(mean(s3m1_mu_dent0t1_pois),hdi(s3m1_mu_dent0t1_pois, credMass = 0.95))
c(mean(s3m1_mu_dent0t2_pois),hdi(s3m1_mu_dent0t2_pois, credMass = 0.95))
c(mean(s3m1_mu_dent1t1_pois),hdi(s3m1_mu_dent1t1_pois, credMass = 0.95))
c(mean(s3m1_mu_dent1t2_pois),hdi(s3m1_mu_dent1t2_pois, credMass = 0.95))

c(mean(s3m1_mu_socwork0t1_pois),hdi(s3m1_mu_socwork0t1_pois, credMass = 0.95))
c(mean(s3m1_mu_socwork0t2_pois),hdi(s3m1_mu_socwork0t2_pois, credMass = 0.95))
c(mean(s3m1_mu_socwork1t1_pois),hdi(s3m1_mu_socwork1t1_pois, credMass = 0.95))
c(mean(s3m1_mu_socwork1t2_pois),hdi(s3m1_mu_socwork1t2_pois, credMass = 0.95))

c(mean(s3m1_mu_comwork0t1_pois),hdi(s3m1_mu_comwork0t1_pois, credMass = 0.95))
c(mean(s3m1_mu_comwork0t2_pois),hdi(s3m1_mu_comwork0t2_pois, credMass = 0.95))
c(mean(s3m1_mu_comwork1t1_pois),hdi(s3m1_mu_comwork1t1_pois, credMass = 0.95))
c(mean(s3m1_mu_comwork1t2_pois),hdi(s3m1_mu_comwork1t2_pois, credMass = 0.95))

c(mean(s3m1_mu_gp0t1_pois),hdi(s3m1_mu_gp0t1_pois, credMass = 0.95))
c(mean(s3m1_mu_gp0t2_pois),hdi(s3m1_mu_gp0t2_pois, credMass = 0.95))
c(mean(s3m1_mu_gp1t1_pois),hdi(s3m1_mu_gp1t1_pois, credMass = 0.95))
c(mean(s3m1_mu_gp1t2_pois),hdi(s3m1_mu_gp1t2_pois, credMass = 0.95))

c(mean(s3m1_mu_nurse0t1_pois),hdi(s3m1_mu_nurse0t1_pois, credMass = 0.95))
c(mean(s3m1_mu_nurse0t2_pois),hdi(s3m1_mu_nurse0t2_pois, credMass = 0.95))
c(mean(s3m1_mu_nurse1t1_pois),hdi(s3m1_mu_nurse1t1_pois, credMass = 0.95))
c(mean(s3m1_mu_nurse1t2_pois),hdi(s3m1_mu_nurse1t2_pois, credMass = 0.95))

c(mean(s3m1_mu_therap0t1_pois),hdi(s3m1_mu_therap0t1_pois, credMass = 0.95))
c(mean(s3m1_mu_therap0t2_pois),hdi(s3m1_mu_therap0t2_pois, credMass = 0.95))
c(mean(s3m1_mu_therap1t1_pois),hdi(s3m1_mu_therap1t1_pois, credMass = 0.95))
c(mean(s3m1_mu_therap1t2_pois),hdi(s3m1_mu_therap1t2_pois, credMass = 0.95))


c(mean(s3m1_mu_c0t1_pois),hdi(s3m1_mu_c0t1_pois, credMass = 0.95))
c(mean(s3m1_mu_c0t2_pois),hdi(s3m1_mu_c0t2_pois, credMass = 0.95))
c(mean(s3m1_mu_c1t1_pois),hdi(s3m1_mu_c1t1_pois, credMass = 0.95))
c(mean(s3m1_mu_c1t2_pois),hdi(s3m1_mu_c1t2_pois, credMass = 0.95))

c(mean(s3m1_mu_tc0_pois),hdi(s3m1_mu_tc0_pois, credMass = 0.95))
c(mean(s3m1_mu_tc1_pois),hdi(s3m1_mu_tc1_pois, credMass = 0.95))

c(mean(s3m1_delta_tc_pois),hdi(s3m1_delta_tc_pois, credMass = 0.95))
mean_m1_delta_tc_pois <- mean(s3m1_delta_tc_pois)
ci_m1_delta_tc_pois <- hdi(s3m1_delta_tc_pois, credMass = 0.95)

#construct ggdataframe for plotting comparison
df_s3 <- data.frame(
  "method" <- c("m1"),
  "estimate" <- c(mean_m1_delta_tc_pois),
  "lb" <- c(ci_m1_delta_tc_pois[1]),
  "ub" <- c(ci_m1_delta_tc_pois[2])
)
names(df_s3) <- c("method","estimate","lb","ub")
df_s3$methodf <- as.factor(df_s3$method)

ggplot(df_s3, aes(x=methodf, y=estimate)) + 
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
#saveRDS(df_s3,"df_est_s3.rds")









