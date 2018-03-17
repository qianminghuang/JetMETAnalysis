from CRABClient.UserUtilities import config, getUsernameFromSiteDB

config = config()
config.General.requestName = 'QCDHLTJEC_pu-v'
config.General.transferOutputs = True
config.General.transferLogs = False
config.JobType.pluginName = 'Analysis'
config.JobType.psetName = 'run_JRA_hlt_cfg.py'
config.JobType.maxJobRuntimeMin = 2750
config.Data.inputDataset = '/QCD_Pt-15to3000_TuneCUETP8M1_Flat_13TeV_pythia8/qihuang-Fall16HLTJEC_80X_FlatPU0to70HcalNZSRAW_qianming_v2-aea21c243c8e789c5dae195ffa8f5f27/USER'
config.Data.inputDBS = 'phys03'
config.Data.splitting = 'FileBased'
config.Data.unitsPerJob = 10
config.Data.outLFNDirBase = '/store/group/phys_jetmet/qihuang/HLT902JRA/pu/'
config.Data.publication = False
config.Site.storageSite = 'T2_CH_CERN'
