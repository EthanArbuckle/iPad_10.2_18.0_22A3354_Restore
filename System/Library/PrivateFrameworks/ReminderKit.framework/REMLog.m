@implementation REMLog

+ (OS_os_log)xpc
{
  if (xpc_onceToken != -1)
    dispatch_once(&xpc_onceToken, &__block_literal_global_1);
  return (OS_os_log *)(id)xpc___log;
}

+ (OS_os_log)utility
{
  if (utility_onceToken != -1)
    dispatch_once(&utility_onceToken, &__block_literal_global_25);
  return (OS_os_log *)(id)utility___log;
}

+ (OS_os_log)cloudkit
{
  if (cloudkit_onceToken != -1)
    dispatch_once(&cloudkit_onceToken, &__block_literal_global_32);
  return (OS_os_log *)(id)cloudkit___log;
}

void __13__REMLog_xpc__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "xpc");
  v1 = (void *)xpc___log;
  xpc___log = (uint64_t)v0;

}

+ (OS_os_log)ui
{
  if (ui_onceToken != -1)
    dispatch_once(&ui_onceToken, &__block_literal_global_7);
  return (OS_os_log *)(id)ui___log;
}

void __20__REMLog_userAction__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "userAction");
  v1 = (void *)userAction___log;
  userAction___log = (uint64_t)v0;

}

void __19__REMLog_analytics__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "analytics");
  v1 = (void *)analytics___log;
  analytics___log = (uint64_t)v0;

}

void __17__REMLog_utility__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "utility");
  v1 = (void *)utility___log;
  utility___log = (uint64_t)v0;

}

void __17__REMLog_siriKit__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "siriKit");
  v1 = (void *)siriKit___log;
  siriKit___log = (uint64_t)v0;

}

void __13__REMLog_ppt__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "ppt");
  v1 = (void *)ppt___log;
  ppt___log = (uint64_t)v0;

}

void __12__REMLog_ui__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "ui");
  v1 = (void *)ui___log;
  ui___log = (uint64_t)v0;

}

+ (OS_os_log)userAction
{
  if (userAction_onceToken != -1)
    dispatch_once(&userAction_onceToken, &__block_literal_global_40);
  return (OS_os_log *)(id)userAction___log;
}

+ (OS_os_log)siriKit
{
  if (siriKit_onceToken != -1)
    dispatch_once(&siriKit_onceToken, &__block_literal_global_42);
  return (OS_os_log *)(id)siriKit___log;
}

+ (OS_os_log)ppt
{
  if (ppt_onceToken != -1)
    dispatch_once(&ppt_onceToken, &__block_literal_global_56);
  return (OS_os_log *)(id)ppt___log;
}

+ (OS_os_log)analytics
{
  if (analytics_onceToken != -1)
    dispatch_once(&analytics_onceToken, &__block_literal_global_54);
  return (OS_os_log *)(id)analytics___log;
}

+ (OS_os_log)changeTracking
{
  if (changeTracking_onceToken != -1)
    dispatch_once(&changeTracking_onceToken, &__block_literal_global_3);
  return (OS_os_log *)(id)changeTracking___log;
}

void __24__REMLog_changeTracking__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "changeTracking");
  v1 = (void *)changeTracking___log;
  changeTracking___log = (uint64_t)v0;

}

+ (OS_os_log)editor
{
  if (editor_onceToken != -1)
    dispatch_once(&editor_onceToken, &__block_literal_global_5);
  return (OS_os_log *)(id)editor___log;
}

void __16__REMLog_editor__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "editor");
  v1 = (void *)editor___log;
  editor___log = (uint64_t)v0;

}

+ (OS_os_log)crdt
{
  if (crdt_onceToken != -1)
    dispatch_once(&crdt_onceToken, &__block_literal_global_9);
  return (OS_os_log *)(id)crdt___log;
}

void __14__REMLog_crdt__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "crdt");
  v1 = (void *)crdt___log;
  crdt___log = (uint64_t)v0;

}

+ (OS_os_log)alarmEngine
{
  if (alarmEngine_onceToken != -1)
    dispatch_once(&alarmEngine_onceToken, &__block_literal_global_11);
  return (OS_os_log *)(id)alarmEngine___log;
}

void __21__REMLog_alarmEngine__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "alarmEngine");
  v1 = (void *)alarmEngine___log;
  alarmEngine___log = (uint64_t)v0;

}

+ (OS_os_log)timelineEngine
{
  if (timelineEngine_onceToken != -1)
    dispatch_once(&timelineEngine_onceToken, &__block_literal_global_13);
  return (OS_os_log *)(id)timelineEngine___log;
}

void __24__REMLog_timelineEngine__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "timelineEngine");
  v1 = (void *)timelineEngine___log;
  timelineEngine___log = (uint64_t)v0;

}

+ (OS_os_log)housekeepingingActivityScheduler
{
  if (housekeepingingActivityScheduler_onceToken != -1)
    dispatch_once(&housekeepingingActivityScheduler_onceToken, &__block_literal_global_15);
  return (OS_os_log *)(id)housekeepingingActivityScheduler___log;
}

void __42__REMLog_housekeepingingActivityScheduler__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "housekeepingingActivityScheduler");
  v1 = (void *)housekeepingingActivityScheduler___log;
  housekeepingingActivityScheduler___log = (uint64_t)v0;

}

+ (OS_os_log)suggestedAttributesAutoTrainer
{
  if (suggestedAttributesAutoTrainer_onceToken != -1)
    dispatch_once(&suggestedAttributesAutoTrainer_onceToken, &__block_literal_global_17);
  return (OS_os_log *)(id)suggestedAttributesAutoTrainer___log;
}

void __40__REMLog_suggestedAttributesAutoTrainer__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "suggestedAttributesAutoTrainer");
  v1 = (void *)suggestedAttributesAutoTrainer___log;
  suggestedAttributesAutoTrainer___log = (uint64_t)v0;

}

+ (OS_os_log)inlineTagAutoConvertEngine
{
  if (inlineTagAutoConvertEngine_onceToken != -1)
    dispatch_once(&inlineTagAutoConvertEngine_onceToken, &__block_literal_global_19);
  return (OS_os_log *)(id)inlineTagAutoConvertEngine___log;
}

void __36__REMLog_inlineTagAutoConvertEngine__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "inlineTagAutoConvertEngine");
  v1 = (void *)inlineTagAutoConvertEngine___log;
  inlineTagAutoConvertEngine___log = (uint64_t)v0;

}

+ (OS_os_log)templates
{
  if (templates_onceToken != -1)
    dispatch_once(&templates_onceToken, &__block_literal_global_21);
  return (OS_os_log *)(id)templates___log;
}

void __19__REMLog_templates__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "templates");
  v1 = (void *)templates___log;
  templates___log = (uint64_t)v0;

}

+ (OS_os_log)accountPlugin
{
  if (accountPlugin_onceToken != -1)
    dispatch_once(&accountPlugin_onceToken, &__block_literal_global_23);
  return (OS_os_log *)(id)accountPlugin___log;
}

void __23__REMLog_accountPlugin__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "accountPlugin");
  v1 = (void *)accountPlugin___log;
  accountPlugin___log = (uint64_t)v0;

}

+ (OS_os_log)suggestedAttributes
{
  if (suggestedAttributes_onceToken != -1)
    dispatch_once(&suggestedAttributes_onceToken, &__block_literal_global_27);
  return (OS_os_log *)(id)suggestedAttributes___log;
}

void __29__REMLog_suggestedAttributes__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit.store", "suggestedAttributes");
  v1 = (void *)suggestedAttributes___log;
  suggestedAttributes___log = (uint64_t)v0;

}

+ (OS_os_log)intelligentGrocery
{
  if (intelligentGrocery_onceToken != -1)
    dispatch_once(&intelligentGrocery_onceToken, &__block_literal_global_30);
  return (OS_os_log *)(id)intelligentGrocery___log;
}

void __28__REMLog_intelligentGrocery__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit.store", "intelligentGrocery");
  v1 = (void *)intelligentGrocery___log;
  intelligentGrocery___log = (uint64_t)v0;

}

void __18__REMLog_cloudkit__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "cloudkit");
  v1 = (void *)cloudkit___log;
  cloudkit___log = (uint64_t)v0;

}

+ (OS_os_log)cloudkitCollaboration
{
  if (cloudkitCollaboration_onceToken != -1)
    dispatch_once(&cloudkitCollaboration_onceToken, &__block_literal_global_34);
  return (OS_os_log *)(id)cloudkitCollaboration___log;
}

void __31__REMLog_cloudkitCollaboration__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "cloudkit.collaboration");
  v1 = (void *)cloudkitCollaboration___log;
  cloudkitCollaboration___log = (uint64_t)v0;

}

+ (OS_os_log)migration
{
  if (migration_onceToken != -1)
    dispatch_once(&migration_onceToken, &__block_literal_global_36);
  return (OS_os_log *)(id)migration___log;
}

void __19__REMLog_migration__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "migration");
  v1 = (void *)migration___log;
  migration___log = (uint64_t)v0;

}

+ (OS_os_log)dataAccess
{
  if (dataAccess_onceToken != -1)
    dispatch_once(&dataAccess_onceToken, &__block_literal_global_38);
  return (OS_os_log *)(id)dataAccess___log;
}

void __20__REMLog_dataAccess__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "dataAccess");
  v1 = (void *)dataAccess___log;
  dataAccess___log = (uint64_t)v0;

}

+ (OS_os_log)appIntents
{
  if (appIntents_onceToken != -1)
    dispatch_once(&appIntents_onceToken, &__block_literal_global_44);
  return (OS_os_log *)(id)appIntents___log;
}

void __20__REMLog_appIntents__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "appIntents");
  v1 = (void *)appIntents___log;
  appIntents___log = (uint64_t)v0;

}

+ (OS_os_log)applicationShortcut
{
  if (applicationShortcut_onceToken != -1)
    dispatch_once(&applicationShortcut_onceToken, &__block_literal_global_46);
  return (OS_os_log *)(id)applicationShortcut___log;
}

void __29__REMLog_applicationShortcut__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "applicationShortcut");
  v1 = (void *)applicationShortcut___log;
  applicationShortcut___log = (uint64_t)v0;

}

+ (OS_os_log)notification
{
  if (notification_onceToken != -1)
    dispatch_once(&notification_onceToken, &__block_literal_global_48);
  return (OS_os_log *)(id)notification___log;
}

void __22__REMLog_notification__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "notification");
  v1 = (void *)notification___log;
  notification___log = (uint64_t)v0;

}

+ (id)search
{
  if (search_onceToken != -1)
    dispatch_once(&search_onceToken, &__block_literal_global_50);
  return (id)search___log;
}

void __16__REMLog_search__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "search");
  v1 = (void *)search___log;
  search___log = (uint64_t)v0;

}

+ (OS_os_log)account
{
  if (account_onceToken != -1)
    dispatch_once(&account_onceToken, &__block_literal_global_52);
  return (OS_os_log *)(id)account___log;
}

void __17__REMLog_account__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "account");
  v1 = (void *)account___log;
  account___log = (uint64_t)v0;

}

+ (OS_os_log)scripting
{
  if (scripting_onceToken != -1)
    dispatch_once(&scripting_onceToken, &__block_literal_global_58);
  return (OS_os_log *)(id)scripting___log;
}

void __19__REMLog_scripting__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.reminderkit", "scripting");
  v1 = (void *)scripting___log;
  scripting___log = (uint64_t)v0;

}

@end
