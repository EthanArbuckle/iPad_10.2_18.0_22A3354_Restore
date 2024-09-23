@implementation TXMain

- (TXMain)init
{
  TXMain *v2;
  TXMain *v3;
  uint64_t v4;
  OZFactory *Instance;
  TXTextInput_Factory *v6;
  uint64_t v7;
  OZFactory *v8;
  TXTextBehavior_Factory *v9;
  uint64_t v10;
  OZFactory *v11;
  TXTextTrackingBehavior_Factory *v12;
  uint64_t v13;
  OZFactory *v14;
  TXTypeOnBehavior_Factory *v15;
  uint64_t v16;
  OZFactory *v17;
  TXCrawlLeftBehavior_Factory *v18;
  uint64_t v19;
  OZFactory *v20;
  TXCrawlRightBehavior_Factory *v21;
  uint64_t v22;
  OZFactory *v23;
  TXScrollUpBehavior_Factory *v24;
  uint64_t v25;
  OZFactory *v26;
  TXScrollDownBehavior_Factory *v27;
  uint64_t v28;
  OZFactory *v29;
  TXTextSequenceBehavior_Factory *v30;
  uint64_t v31;
  OZFactory *v32;
  TXSequenceBehavior_Factory *v33;
  uint64_t v34;
  OZFactory *v35;
  TXTextScrollBehavior_Factory *v36;
  uint64_t v37;
  OZFactory *v38;
  TXTextStyle_Factory *v39;
  uint64_t v40;
  OZFactory *v41;
  TXNumberGenerator_Factory *v42;
  uint64_t v43;
  OZFactory *v44;
  TXTimecodeGenerator_Factory *v45;
  uint64_t v46;
  OZFactory *v47;
  TXTimeDateGenerator_Factory *v48;
  uint64_t v49;
  OZFactory *v50;
  TXTextFromFileGenerator_Factory *v51;
  uint64_t v52;
  OZFactory *v53;
  TXTranscriptionGenerator_Factory *v54;
  uint64_t v55;
  OZFactory *v56;
  TXTextGenerator_Factory *v57;
  uint64_t v58;
  OZFactory *v59;
  TXChannelString_Factory *v60;
  uint64_t v61;
  OZFactory *v62;
  TXChannelFont_Factory *v63;
  uint64_t v64;
  OZFactory *v65;
  TXChannelAlignment_Factory *v66;
  uint64_t v67;
  OZFactory *v68;
  objc_super v70;

  v70.receiver = self;
  v70.super_class = (Class)TXMain;
  v2 = -[TXMain init](&v70, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = theApp;
    Instance = (OZFactory *)TXTextLayout_Factory::getInstance((TXTextLayout_Factory *)v2);
    v6 = (TXTextInput_Factory *)OZFactories::addFactory(*(uint64_t ***)(v4 + 32), Instance);
    v7 = theApp;
    v8 = (OZFactory *)TXTextInput_Factory::getInstance(v6);
    v9 = (TXTextBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v7 + 32), v8);
    v10 = theApp;
    v11 = (OZFactory *)TXTextBehavior_Factory::getInstance(v9);
    v12 = (TXTextTrackingBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v10 + 32), v11);
    v13 = theApp;
    v14 = (OZFactory *)TXTextTrackingBehavior_Factory::getInstance(v12);
    v15 = (TXTypeOnBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v13 + 32), v14);
    v16 = theApp;
    v17 = (OZFactory *)TXTypeOnBehavior_Factory::getInstance(v15);
    v18 = (TXCrawlLeftBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v16 + 32), v17);
    v19 = theApp;
    v20 = (OZFactory *)TXCrawlLeftBehavior_Factory::getInstance(v18);
    v21 = (TXCrawlRightBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v19 + 32), v20);
    v22 = theApp;
    v23 = (OZFactory *)TXCrawlRightBehavior_Factory::getInstance(v21);
    v24 = (TXScrollUpBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v22 + 32), v23);
    v25 = theApp;
    v26 = (OZFactory *)TXScrollUpBehavior_Factory::getInstance(v24);
    v27 = (TXScrollDownBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v25 + 32), v26);
    v28 = theApp;
    v29 = (OZFactory *)TXScrollDownBehavior_Factory::getInstance(v27);
    v30 = (TXTextSequenceBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v28 + 32), v29);
    v31 = theApp;
    v32 = (OZFactory *)TXTextSequenceBehavior_Factory::getInstance(v30);
    v33 = (TXSequenceBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v31 + 32), v32);
    v34 = theApp;
    v35 = (OZFactory *)TXSequenceBehavior_Factory::getInstance(v33);
    v36 = (TXTextScrollBehavior_Factory *)OZFactories::addFactory(*(uint64_t ***)(v34 + 32), v35);
    v37 = theApp;
    v38 = (OZFactory *)TXTextScrollBehavior_Factory::getInstance(v36);
    v39 = (TXTextStyle_Factory *)OZFactories::addFactory(*(uint64_t ***)(v37 + 32), v38);
    v40 = theApp;
    v41 = (OZFactory *)TXTextStyle_Factory::getInstance(v39);
    v42 = (TXNumberGenerator_Factory *)OZFactories::addFactory(*(uint64_t ***)(v40 + 32), v41);
    v43 = theApp;
    v44 = (OZFactory *)TXNumberGenerator_Factory::getInstance(v42);
    v45 = (TXTimecodeGenerator_Factory *)OZFactories::addFactory(*(uint64_t ***)(v43 + 32), v44);
    v46 = theApp;
    v47 = (OZFactory *)TXTimecodeGenerator_Factory::getInstance(v45);
    v48 = (TXTimeDateGenerator_Factory *)OZFactories::addFactory(*(uint64_t ***)(v46 + 32), v47);
    v49 = theApp;
    v50 = (OZFactory *)TXTimeDateGenerator_Factory::getInstance(v48);
    v51 = (TXTextFromFileGenerator_Factory *)OZFactories::addFactory(*(uint64_t ***)(v49 + 32), v50);
    v52 = theApp;
    v53 = (OZFactory *)TXTextFromFileGenerator_Factory::getInstance(v51);
    v54 = (TXTranscriptionGenerator_Factory *)OZFactories::addFactory(*(uint64_t ***)(v52 + 32), v53);
    v55 = theApp;
    v56 = (OZFactory *)TXTranscriptionGenerator_Factory::getInstance(v54);
    v57 = (TXTextGenerator_Factory *)OZFactories::addFactory(*(uint64_t ***)(v55 + 32), v56);
    v58 = theApp;
    v59 = (OZFactory *)TXTextGenerator_Factory::getInstance(v57);
    v60 = (TXChannelString_Factory *)OZFactories::addFactory(*(uint64_t ***)(v58 + 32), v59);
    v61 = theApp;
    v62 = (OZFactory *)TXChannelString_Factory::getInstance(v60);
    v63 = (TXChannelFont_Factory *)OZFactories::addFactory(*(uint64_t ***)(v61 + 32), v62);
    v64 = theApp;
    v65 = (OZFactory *)TXChannelFont_Factory::getInstance(v63);
    v66 = (TXChannelAlignment_Factory *)OZFactories::addFactory(*(uint64_t ***)(v64 + 32), v65);
    v67 = theApp;
    v68 = (OZFactory *)TXChannelAlignment_Factory::getInstance(v66);
    OZFactories::addFactory(*(uint64_t ***)(v67 + 32), v68);
  }
  return v3;
}

- (BOOL)validateAction:(SEL)a3
{
  return 1;
}

- (void)applicationDidFinishLaunching
{
  NSObject *global_queue;

  global_queue = dispatch_get_global_queue(25, 0);
  dispatch_async(global_queue, &__block_literal_global_49);
}

@end
