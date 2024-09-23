@implementation SAClassRegistry

+ (id)sharedClassRegistry
{
  if (qword_1ED010E00 != -1)
    dispatch_once(&qword_1ED010E00, &__block_literal_global_0);
  return (id)_MergedGlobals_1;
}

void __38__SAClassRegistry_sharedClassRegistry__block_invoke()
{
  SAClassRegistry *v0;
  void *v1;

  v0 = objc_alloc_init(SAClassRegistry);
  v1 = (void *)_MergedGlobals_1;
  _MergedGlobals_1 = (uint64_t)v0;

}

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_1);
}

void __29__SAClassRegistry_initialize__block_invoke()
{
  id v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  dispatch_queue_t v6;
  void *v7;
  _QWORD v8[71];
  _QWORD v9[72];

  v9[71] = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc(MEMORY[0x1E0C99E08]);
  v8[0] = CFSTR("com.apple.ace.contact");
  v8[1] = CFSTR("com.apple.ace.acousticid");
  v9[0] = CFSTR("SAAB");
  v9[1] = CFSTR("SAAI");
  v8[2] = CFSTR("com.apple.ace.alarm");
  v8[3] = CFSTR("com.apple.ace.answer");
  v9[2] = CFSTR("SAAlarm");
  v9[3] = CFSTR("SAAnswer");
  v8[4] = CFSTR("com.apple.ace.apps");
  v8[5] = CFSTR("com.apple.ace.alternatives");
  v9[4] = CFSTR("SAApps");
  v9[5] = CFSTR("SAAR");
  v8[6] = CFSTR("com.apple.ace.attention");
  v8[7] = CFSTR("com.apple.ace.accessibility");
  v9[6] = CFSTR("SAAttention");
  v9[7] = CFSTR("SAAX");
  v8[8] = CFSTR("com.apple.ace.calendar");
  v8[9] = CFSTR("com.apple.ace.ui.card");
  v9[8] = CFSTR("SACalendar");
  v9[9] = CFSTR("SACard");
  v8[10] = CFSTR("com.apple.ace.clientflow");
  v8[11] = CFSTR("com.apple.ace.client.local.messages");
  v9[10] = CFSTR("SACF");
  v9[11] = CFSTR("SACFM");
  v8[12] = CFSTR("com.apple.ace.clientflow.local.pex");
  v8[13] = CFSTR("com.apple.ace.clock");
  v9[12] = CFSTR("SACFPEX");
  v9[13] = CFSTR("SAClock");
  v8[14] = CFSTR("com.apple.ace.dailybriefing");
  v8[15] = CFSTR("com.apple.ace.devicecontrol");
  v9[14] = CFSTR("SADailyBriefing");
  v9[15] = CFSTR("SADeviceControl");
  v8[16] = CFSTR("com.apple.ace.device");
  v8[17] = CFSTR("com.apple.ace.diagnostic");
  v9[16] = CFSTR("SADevice");
  v9[17] = CFSTR("SADIAG");
  v8[18] = CFSTR("com.apple.ace.dialog");
  v8[19] = CFSTR("com.apple.ace.devicePlaySound");
  v9[18] = CFSTR("SADialog");
  v9[19] = CFSTR("SADP");
  v8[20] = CFSTR("com.apple.ace.execution");
  v8[21] = CFSTR("com.apple.ace.email");
  v9[20] = CFSTR("SAE");
  v9[21] = CFSTR("SAEmail");
  v8[22] = CFSTR("com.apple.ace.fmf");
  v8[23] = CFSTR("com.apple.ace.generalknowledge");
  v9[22] = CFSTR("SAFmf");
  v9[23] = CFSTR("SAGK");
  v8[24] = CFSTR("com.apple.ace.glance");
  v8[25] = CFSTR("com.apple.ace.system");
  v9[24] = CFSTR("SAGL");
  v9[25] = CFSTR("SA");
  v8[26] = CFSTR("com.apple.ace.guidance");
  v8[27] = CFSTR("com.apple.ace.homeautomation");
  v9[26] = CFSTR("SAGuidance");
  v9[27] = CFSTR("SAHA");
  v8[28] = CFSTR("com.apple.ace.health");
  v8[29] = CFSTR("com.apple.ace.homecommunication");
  v9[28] = CFSTR("SAHL");
  v9[29] = CFSTR("SAHomeCommunication");
  v8[30] = CFSTR("com.apple.ace.iCloud");
  v8[31] = CFSTR("com.apple.ace.command.assistant.intent");
  v9[30] = CFSTR("SAiCloud");
  v9[31] = CFSTR("SAIntentGroup");
  v8[32] = CFSTR("com.apple.ace.knowledgeStore");
  v8[33] = CFSTR("com.apple.ace.livecontent");
  v9[32] = CFSTR("SAKnowledge");
  v9[33] = CFSTR("SALCM");
  v8[34] = CFSTR("com.apple.ace.localsearch");
  v8[35] = CFSTR("com.apple.ace.mac");
  v9[34] = CFSTR("SALocalSearch");
  v9[35] = CFSTR("SAMac");
  v8[36] = CFSTR("com.apple.ace.microblog");
  v8[37] = CFSTR("com.apple.ace.movie");
  v9[36] = CFSTR("SAMicroblog");
  v9[37] = CFSTR("SAMovie");
  v8[38] = CFSTR("com.apple.ace.movieV2");
  v8[39] = CFSTR("com.apple.ace.media");
  v9[38] = CFSTR("SAMovieV2");
  v9[39] = CFSTR("SAMP");
  v8[40] = CFSTR("com.apple.ace.note");
  v8[41] = CFSTR("com.apple.ace.notification");
  v9[40] = CFSTR("SANote");
  v9[41] = CFSTR("SANotification");
  v8[42] = CFSTR("com.apple.ace.nowplaying");
  v8[43] = CFSTR("com.apple.ace.nowplaying.video");
  v9[42] = CFSTR("SANP");
  v9[43] = CFSTR("SANPVideo");
  v8[44] = CFSTR("com.apple.ace.phone");
  v8[45] = CFSTR("com.apple.ace.profile");
  v9[44] = CFSTR("SAPhone");
  v9[45] = CFSTR("SAProfile");
  v8[46] = CFSTR("com.apple.ace.radar");
  v8[47] = CFSTR("com.apple.ace.requestdispatch");
  v9[46] = CFSTR("SARadar");
  v9[47] = CFSTR("SARD");
  v8[48] = CFSTR("com.apple.ace.remembers");
  v8[49] = CFSTR("com.apple.ace.reminder");
  v9[48] = CFSTR("SARemembers");
  v9[49] = CFSTR("SAReminder");
  v8[50] = CFSTR("com.apple.ace.restaurant");
  v8[51] = CFSTR("com.apple.ace.onscreenaction");
  v9[50] = CFSTR("SARestaurant");
  v9[51] = CFSTR("SAScreenAction");
  v8[52] = CFSTR("com.apple.ace.setting");
  v8[53] = CFSTR("com.apple.ace.speech");
  v9[52] = CFSTR("SASetting");
  v9[53] = CFSTR("SAS");
  v8[54] = CFSTR("com.apple.ace.sms");
  v8[55] = CFSTR("com.apple.ace.sports");
  v9[54] = CFSTR("SASms");
  v9[55] = CFSTR("SASports");
  v8[56] = CFSTR("com.apple.ace.templates");
  v8[57] = CFSTR("com.apple.ace.stock");
  v9[56] = CFSTR("SAST");
  v9[57] = CFSTR("SAStock");
  v8[58] = CFSTR("com.apple.ace.vector");
  v8[59] = CFSTR("com.apple.ace.stopwatch");
  v9[58] = CFSTR("SASV");
  v9[59] = CFSTR("SASW");
  v8[60] = CFSTR("com.apple.ace.sync");
  v8[61] = CFSTR("com.apple.ace.timer");
  v9[60] = CFSTR("SASync");
  v9[61] = CFSTR("SATimer");
  v8[62] = CFSTR("com.apple.ace.tts");
  v8[63] = CFSTR("com.apple.ace.assistant");
  v9[62] = CFSTR("SATTS");
  v9[63] = CFSTR("SAUI");
  v8[64] = CFSTR("com.apple.ace.ui.lite");
  v9[64] = CFSTR("SAUIL");
  v8[65] = CFSTR("com.apple.ace.ui.templates");
  v9[65] = CFSTR("SAUITemplate");
  v8[66] = CFSTR("com.apple.ace.universalsearch");
  v9[66] = CFSTR("SAUS");
  v8[67] = CFSTR("com.apple.ace.videocontent");
  v9[67] = CFSTR("SAVCS");
  v8[68] = CFSTR("com.apple.ace.weather");
  v9[68] = CFSTR("SAWeather");
  v8[69] = CFSTR("com.apple.ace.websearch");
  v9[69] = CFSTR("SAWeb");
  v8[70] = CFSTR("com.apple.ace.watchlist");
  v9[70] = CFSTR("SAWL");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 71);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "initWithDictionary:", v1);
  v3 = (void *)qword_1ED010E08;
  qword_1ED010E08 = v2;

  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = (void *)qword_1ED010E10;
  qword_1ED010E10 = (uint64_t)v4;

  v6 = dispatch_queue_create("SAClassRegistry", 0);
  v7 = (void *)qword_1ED010E18;
  qword_1ED010E18 = (uint64_t)v6;

}

+ (void)registerAcronym:(id)a3 forGroupWithIdentifier:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = qword_1ED010E18;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__SAClassRegistry_registerAcronym_forGroupWithIdentifier___block_invoke;
  block[3] = &unk_1E4C82410;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  dispatch_sync(v7, block);

}

uint64_t __58__SAClassRegistry_registerAcronym_forGroupWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)qword_1ED010E08, "setObject:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)registerClass:(Class)a3 forAceClassWithName:(id)a4 inGroupWithIdentifier:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  Class v16;

  v8 = a4;
  v9 = a5;
  v10 = qword_1ED010E18;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__SAClassRegistry_registerClass_forAceClassWithName_inGroupWithIdentifier___block_invoke;
  block[3] = &unk_1E4C82438;
  block[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_sync(v10, block);

}

uint64_t __75__SAClassRegistry_registerClass_forAceClassWithName_inGroupWithIdentifier___block_invoke(_QWORD *a1)
{
  return objc_msgSend((id)objc_opt_class(), "registerClass:forAceClassName:inGroupWithIdentifier:", a1[7], a1[5], a1[6]);
}

+ (void)registerClass:(Class)a3 forAceClassName:(id)a4 inGroupWithIdentifier:(id)a5
{
  id v7;
  id v8;
  id v9;

  v9 = a4;
  v7 = a5;
  objc_msgSend((id)qword_1ED010E10, "objectForKey:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend((id)qword_1ED010E10, "setObject:forKey:", v8, v7);
  }
  objc_msgSend(v8, "setObject:forKey:", a3, v9);

}

- (Class)classForAceClassWithName:(id)a3 inGroupWithIdentifier:(id)a4
{
  id v5;
  id v6;
  void *v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "classForAceClassName:inGroupWithIdentifier:", v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v7;
}

+ (Class)classForAceClassName:(id)a3 inGroupWithIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a3;
  v7 = a4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2050000000;
  v21 = 0;
  v8 = qword_1ED010E18;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__SAClassRegistry_classForAceClassName_inGroupWithIdentifier___block_invoke;
  v13[3] = &unk_1E4C82460;
  v14 = v7;
  v15 = v6;
  v16 = &v18;
  v17 = a1;
  v9 = v6;
  v10 = v7;
  dispatch_sync(v8, v13);
  v11 = (id)v19[3];

  _Block_object_dispose(&v18, 8);
  return (Class)v11;
}

void __62__SAClassRegistry_classForAceClassName_inGroupWithIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSString *v4;
  NSString *v5;
  uint64_t v6;
  id v7;

  objc_msgSend((id)qword_1ED010E10, "objectForKey:", *(_QWORD *)(a1 + 32));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v7, "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = v7;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend((id)qword_1ED010E08, "objectForKey:", *(_QWORD *)(a1 + 32));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", *(_QWORD *)(a1 + 40));
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = NSClassFromString(v4);
    v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    if (v6)
      objc_msgSend(*(id *)(a1 + 56), "registerClass:forAceClassName:inGroupWithIdentifier:", v6, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

    v2 = v7;
  }

}

@end
