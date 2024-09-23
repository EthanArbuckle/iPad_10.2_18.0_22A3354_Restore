@implementation CNVCardParser

+ (id)os_log
{
  if (os_log_cn_once_token_1 != -1)
    dispatch_once(&os_log_cn_once_token_1, &__block_literal_global_2);
  return (id)os_log_cn_once_object_1;
}

void __23__CNVCardParser_os_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.vcard", "CNVCardParser");
  v1 = (void *)os_log_cn_once_object_1;
  os_log_cn_once_object_1 = (uint64_t)v0;

}

+ (unint64_t)countOfCardsInData:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  +[CNVCardRangeFinder allRangesInData:](CNVCardRangeFinder, "allRangesInData:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "left");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return v5;
}

+ (BOOL)parseFirstResultInData:(id)a3 resultBuilder:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithData:", v7);

  LOBYTE(v7) = objc_msgSend(v8, "parseNextResultUsingResultBuilder:", v6);
  return (char)v7;
}

+ (id)newParsingSelectorMap
{
  CNVCardSelectorMap *v2;

  v2 = objc_alloc_init(CNVCardSelectorMap);
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_ADD, CFSTR("ADD"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_ADR, CFSTR("ADR"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_BDAY, CFSTR("BDAY"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_CALURI, CFSTR("CALURI"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_EMAIL, CFSTR("EMAIL"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_FN, CFSTR("FN"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_IMPP, CFSTR("IMPP"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_N, CFSTR("N"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_NICKNAME, CFSTR("NICKNAME"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_NOTE, CFSTR("NOTE"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_ORG, CFSTR("ORG"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_PHONETIC_ORG, CFSTR("X-PHONETIC-ORG"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_PHOTO, CFSTR("PHOTO"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_PRODID, CFSTR("PRODID"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_REV, CFSTR("REV"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_TEL, CFSTR("TEL"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_TITLE, CFSTR("TITLE"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_UID, CFSTR("UID"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_URL, CFSTR("URL"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_VERSION, CFSTR("VERSION"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_ABADR, CFSTR("X-ABADR"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_ABDATE, CFSTR("X-ABDATE"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_ABLABEL, CFSTR("X-ABLABEL"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_ABORDER, CFSTR("X-ABORDER"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_ABPHOTO, CFSTR("X-ABPHOTO"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_AIM, CFSTR("X-AIM"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_AIM_ID, CFSTR("X-AIM-ID"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_ABRELATEDNAMES, CFSTR("X-ABRELATEDNAMES"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_ABSHOWAS, CFSTR("X-ABSHOWAS"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_ABUID, CFSTR("X-ABUID"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_ACTIVITY_ALERT, CFSTR("X-ACTIVITY-ALERT"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_ALTBDAY, CFSTR("X-ALTBDAY"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_APPLE_SUBADMINISTRATIVEAREA, CFSTR("X-APPLE-SUBADMINISTRATIVEAREA"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_APPLE_SUBLOCALITY, CFSTR("X-APPLE-SUBLOCALITY"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_GOOGLE_ID, CFSTR("X-GOOGLE-ID"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_GOOGLE_TALK, CFSTR("X-GOOGLE-TALK"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_GTALK, CFSTR("X-GTALK"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_ICQ, CFSTR("X-ICQ"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_ICQ_ID, CFSTR("X-ICQ-ID"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_IMAGEHASH, CFSTR("X-IMAGEHASH"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_IMAGETYPE, CFSTR("X-IMAGETYPE"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_WALLPAPER, CFSTR("X-WALLPAPER"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_JABBER, CFSTR("X-JABBER"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_JABBER_ID, CFSTR("X-JABBER-ID"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_MAIDENNAME, CFSTR("X-MAIDENNAME"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_MSN, CFSTR("X-MSN"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_MSN_ID, CFSTR("X-MSN-ID"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_PHONETIC_FIRST_NAME, CFSTR("X-PHONETIC-FIRST-NAME"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_PHONETIC_LAST_NAME, CFSTR("X-PHONETIC-LAST-NAME"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_PHONETIC_MIDDLE_NAME, CFSTR("X-PHONETIC-MIDDLE-NAME"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_PRONUNCIATION_FIRST_NAME, CFSTR("X-PRONUNCIATION-FIRST-NAME"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_PRONUNCIATION_LAST_NAME, CFSTR("X-PRONUNCIATION-LAST-NAME"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_QQ, CFSTR("X-QQ"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_QQ_ID, CFSTR("X-QQ-ID"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_SKYPE, CFSTR("X-SKYPE"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_SKYPE_ID, CFSTR("X-SKYPE-ID"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_SKYPE_USERNAME, CFSTR("X-SKYPE-USERNAME"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_SOCIALPROFILE, CFSTR("X-SOCIALPROFILE"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_YAHOO, CFSTR("X-YAHOO"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_YAHOO_ID, CFSTR("X-YAHOO-ID"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_ADDRESSBOOKSERVER_PHONEME_DATA, CFSTR("X-ADDRESSBOOKSERVER-PHONEME-DATA"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_APPLE_LIKENESS_SERVICE_IDENTIFIER, CFSTR("X-APPLE-LIKENESS-SERVICE-IDENTIFIER"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_APPLE_LIKENESS_SOURCE, CFSTR("X-APPLE-LIKENESS-SOURCE"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_APPLE_GUARDIAN_WHITELISTED, CFSTR("X-APPLE-GUARDIAN-WHITELISTED"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_ADDRESSING_GRAMMAR, CFSTR("X-ADDRESSING-GRAMMAR"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_SHARED_PHOTO_DISPLAY_PREF, CFSTR("X-SHARED-PHOTO-DISPLAY-PREF"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_X_IMAGE_BACKGROUND_COLORS_DATA, CFSTR("X-IMAGE-BACKGROUND-COLORS-DATA"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parse_VND_63_SENSITIVE_CONTENT_CONFIG, CFSTR("VND-63-SENSITIVE-CONTENT-CONFIG"));
  return v2;
}

+ (id)newParameterSelectorMap
{
  CNVCardSelectorMap *v2;

  v2 = objc_alloc_init(CNVCardSelectorMap);
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parameter_QUOTED_PRINTABLE_, CFSTR("QUOTED-PRINTABLE"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parameter_BASE64_, CFSTR("BASE64"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parameter_CHARSET_, CFSTR("CHARSET"));
  -[CNVCardSelectorMap setSelector:forString:](v2, "setSelector:forString:", sel_parameter_ENCODING_, CFSTR("ENCODING"));
  return v2;
}

- (CNVCardParser)initWithData:(id)a3
{
  id v4;
  CNVCardReadingOptions *v5;
  CNVCardParser *v6;

  v4 = a3;
  v5 = objc_alloc_init(CNVCardReadingOptions);
  v6 = -[CNVCardParser initWithData:options:](self, "initWithData:options:", v4, v5);

  return v6;
}

- (CNVCardParser)initWithData:(id)a3 options:(id)a4
{
  id v7;
  id v8;
  CNVCardParser *v9;
  CNVCardParser *v10;
  CNVCardParser *v11;
  CNVCardLexer *v12;
  CNVCardLexer *lexer;
  void *v14;
  uint64_t v15;
  _TtP5vCard25CNVCardTagInclusionPolicy_ *tagInclusionPolicy;
  CNVCardMutableNameComponents *v17;
  CNVCardMutableNameComponents *nameComponents;
  NSMutableArray *v19;
  NSMutableArray *unknowns;
  CNVCardDateComponentsParser *v21;
  CNVCardDateComponentsParser *dateComponentsParser;
  uint64_t v23;
  CNVCardSelectorMap *parsingSelectorMap;
  uint64_t v25;
  CNVCardSelectorMap *parameterSelectorMap;
  objc_super v28;

  v7 = a3;
  v8 = a4;
  v28.receiver = self;
  v28.super_class = (Class)CNVCardParser;
  v9 = -[CNVCardParser init](&v28, sel_init);
  v10 = v9;
  v11 = 0;
  if (v7 && v9)
  {
    if (objc_msgSend(v7, "length")
      && (v12 = -[CNVCardLexer initWithData:]([CNVCardLexer alloc], "initWithData:", v7),
          lexer = v10->_lexer,
          v10->_lexer = v12,
          lexer,
          v10->_lexer))
    {
      objc_storeStrong((id *)&v10->_data, a3);
      objc_storeStrong((id *)&v10->_options, a4);
      objc_msgSend(v8, "propertiesToFetch");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[CNVCardTagInclusion policyWithTags:](_TtC5vCard19CNVCardTagInclusion, "policyWithTags:", v14);
      v15 = objc_claimAutoreleasedReturnValue();
      tagInclusionPolicy = v10->_tagInclusionPolicy;
      v10->_tagInclusionPolicy = (_TtP5vCard25CNVCardTagInclusionPolicy_ *)v15;

      v10->_defaultEncoding = objc_msgSend((id)objc_opt_class(), "inferredStringEncodingFromData:", v7);
      v17 = objc_alloc_init(CNVCardMutableNameComponents);
      nameComponents = v10->_nameComponents;
      v10->_nameComponents = v17;

      v10->_fullNameHasZeroLength = 1;
      v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      unknowns = v10->_unknowns;
      v10->_unknowns = v19;

      v21 = objc_alloc_init(CNVCardDateComponentsParser);
      dateComponentsParser = v10->_dateComponentsParser;
      v10->_dateComponentsParser = v21;

      v23 = objc_msgSend((id)objc_opt_class(), "newParsingSelectorMap");
      parsingSelectorMap = v10->_parsingSelectorMap;
      v10->_parsingSelectorMap = (CNVCardSelectorMap *)v23;

      v25 = objc_msgSend((id)objc_opt_class(), "newParameterSelectorMap");
      parameterSelectorMap = v10->_parameterSelectorMap;
      v10->_parameterSelectorMap = (CNVCardSelectorMap *)v25;

      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (id)parseData:(id)a3 resultFactory:(id)a4
{
  id v6;
  id v7;
  CNVCardReadingOptions *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = objc_alloc_init(CNVCardReadingOptions);
  objc_msgSend(a1, "parseData:options:resultFactory:", v7, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)parseData:(id)a3 options:(id)a4 resultFactory:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  +[CNVCardParsingConcurrencyStrategy strategyForOptions:](CNVCardParsingConcurrencyStrategy, "strategyForOptions:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "parseData:options:resultFactory:", v9, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)resultsWithFactory:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[CNVCardParser atEOF](self, "atEOF"))
  {
    do
    {
      v6 = objc_msgSend(v5, "count");
      -[CNVCardParser options](self, "options");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "contactLimit");

      if (v6 >= v8)
        break;
      -[CNVCardParser nextResultWithFactory:progressLength:](self, "nextResultWithFactory:progressLength:", v4, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        break;
      v10 = (void *)v9;
      objc_msgSend(v5, "addObject:", v9);

    }
    while (!-[CNVCardParser atEOF](self, "atEOF"));
  }

  return v5;
}

- (id)nextResultWithFactory:(id)a3 progressLength:(int64_t *)a4
{
  id v4;
  void *v5;
  id v7;

  v7 = a3;
  v4 = v7;
  CNResultWithAutoreleasePool();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __54__CNVCardParser_nextResultWithFactory_progressLength___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pool_nextResultWithFactory:progressLength:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (id)pool_nextResultWithFactory:(id)a3 progressLength:(int64_t *)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  _BOOL4 v10;

  v6 = a3;
  if (!-[CNVCardParser atEOF](self, "atEOF"))
  {
    objc_msgSend(v6, "makeBuilder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[CNVCardParser currentPosition](self, "currentPosition");
    v10 = -[CNVCardParser parseNextResultUsingResultBuilder:](self, "parseNextResultUsingResultBuilder:", v8);
    self->_hasImportErrors = !v10;
    if (a4)
    {
      *a4 = -[CNVCardParser currentPosition](self, "currentPosition") - v9;
      if (self->_hasImportErrors)
      {
LABEL_6:
        v7 = 0;
LABEL_9:

        goto LABEL_10;
      }
    }
    else if (!v10)
    {
      goto LABEL_6;
    }
    objc_msgSend(v8, "build");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v7 = 0;
  if (a4)
    *a4 = 0;
LABEL_10:

  return v7;
}

- (BOOL)parseNextResultUsingResultBuilder:(id)a3
{
  id v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *extensions;
  int v8;
  NSObject *v9;
  CNVCardParsedResultBuilder *v10;
  BOOL v11;
  NSObject *v12;
  CNVCardParsedResultBuilder *resultBuilder;

  v5 = a3;
  objc_storeStrong((id *)&self->_resultBuilder, a3);
  v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  extensions = self->_extensions;
  self->_extensions = v6;

  -[CNVCardLexer advanceToString](self->_lexer, "advanceToString");
  v8 = -[CNVCardLexer readNextToken](self->_lexer, "readNextToken");
  if ((v8 - 32769) <= 1)
  {
    do
      v8 = -[CNVCardLexer readNextToken](self->_lexer, "readNextToken");
    while ((v8 - 32769) < 2);
  }
  if (v8 != 5)
  {
    if (v8 != 65537)
    {
      +[CNVCardLogging vCard](CNVCardLogging, "vCard");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CNVCardParser parseNextResultUsingResultBuilder:].cold.1();

      -[CNVCardLexer advanceToToken:throughTypes:](self->_lexer, "advanceToToken:throughTypes:", 7, 0x4000);
      -[CNVCardLexer advancePastEOL](self->_lexer, "advancePastEOL");
    }
    goto LABEL_25;
  }
  if (!-[CNVCardLexer advanceToToken:throughTypes:](self->_lexer, "advanceToToken:throughTypes:", 8193, 0x4000))
  {
    +[CNVCardLogging vCard](CNVCardLogging, "vCard");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CNVCardParser parseNextResultUsingResultBuilder:].cold.5();
    goto LABEL_24;
  }
  if (!-[CNVCardLexer advanceToToken:throughTypes:](self->_lexer, "advanceToToken:throughTypes:", 6, 0x4000))
  {
    +[CNVCardLogging vCard](CNVCardLogging, "vCard");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CNVCardParser parseNextResultUsingResultBuilder:].cold.4();
    goto LABEL_24;
  }
  if (!-[CNVCardLexer advanceToEOL](self->_lexer, "advanceToEOL"))
  {
    +[CNVCardLogging vCard](CNVCardLogging, "vCard");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CNVCardParser parseNextResultUsingResultBuilder:].cold.3();
    goto LABEL_24;
  }
  if (!-[CNVCardLexer advancePastEOL](self->_lexer, "advancePastEOL"))
  {
    +[CNVCardLogging vCard](CNVCardLogging, "vCard");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[CNVCardParser parseNextResultUsingResultBuilder:].cold.2();
LABEL_24:

LABEL_25:
    -[CNVCardParser cleanUpCardState](self, "cleanUpCardState");
    resultBuilder = self->_resultBuilder;
    self->_resultBuilder = 0;

    v11 = 0;
    goto LABEL_26;
  }
  while (-[CNVCardParser parseLine](self, "parseLine"))
    ;
  -[CNVCardParser reportValues](self, "reportValues");
  if (!-[CNVCardLexer advanceToToken:throughTypes:](self->_lexer, "advanceToToken:throughTypes:", 8193, 0x4000)
    || !-[CNVCardLexer advanceToToken:throughTypes:](self->_lexer, "advanceToToken:throughTypes:", 6, 0x4000))
  {
    goto LABEL_25;
  }
  -[CNVCardLexer advancePastEOL](self->_lexer, "advancePastEOL");
  -[CNVCardParser cleanUpCardState](self, "cleanUpCardState");
  v10 = self->_resultBuilder;
  self->_resultBuilder = 0;

  v11 = 1;
LABEL_26:

  return v11;
}

- (void)cleanUpCardState
{
  CNVCardMutableNameComponents *v3;
  CNVCardMutableNameComponents *nameComponents;
  NSDateComponents *bday;
  NSDateComponents *altBday;
  CNVCardParsedResultBuilder *resultBuilder;
  NSString *carddavUID;
  NSMutableArray *emails;
  NSMutableArray *urls;
  NSMutableArray *calendarURIs;
  NSMutableArray *relatedNames;
  NSMutableArray *dateComponents;
  NSMutableArray *phones;
  NSMutableArray *addresses;
  NSMutableArray *instantMessagingAddresses;
  NSMutableArray *socialProfiles;
  NSMutableDictionary *activityAlerts;
  NSMutableString *notes;
  NSMutableDictionary *extensions;
  NSData *imageData;
  NSString *uid;
  NSMutableArray *addressingGrammars;

  v3 = objc_alloc_init(CNVCardMutableNameComponents);
  nameComponents = self->_nameComponents;
  self->_nameComponents = v3;

  bday = self->_bday;
  self->_bday = 0;

  altBday = self->_altBday;
  self->_altBday = 0;

  self->_fullNameHasZeroLength = 1;
  resultBuilder = self->_resultBuilder;
  self->_resultBuilder = 0;

  carddavUID = self->_carddavUID;
  self->_carddavUID = 0;

  emails = self->_emails;
  self->_emails = 0;

  urls = self->_urls;
  self->_urls = 0;

  calendarURIs = self->_calendarURIs;
  self->_calendarURIs = 0;

  relatedNames = self->_relatedNames;
  self->_relatedNames = 0;

  dateComponents = self->_dateComponents;
  self->_dateComponents = 0;

  phones = self->_phones;
  self->_phones = 0;

  addresses = self->_addresses;
  self->_addresses = 0;

  instantMessagingAddresses = self->_instantMessagingAddresses;
  self->_instantMessagingAddresses = 0;

  socialProfiles = self->_socialProfiles;
  self->_socialProfiles = 0;

  activityAlerts = self->_activityAlerts;
  self->_activityAlerts = 0;

  notes = self->_notes;
  self->_notes = 0;

  extensions = self->_extensions;
  self->_extensions = 0;

  imageData = self->_imageData;
  self->_imageData = 0;

  uid = self->_uid;
  self->_uid = 0;

  addressingGrammars = self->_addressingGrammars;
  self->_addressingGrammars = 0;

  -[NSMutableArray removeAllObjects](self->_unknowns, "removeAllObjects");
}

- (BOOL)hasImportErrors
{
  return self->_hasImportErrors;
}

+ (unint64_t)inferredStringEncodingFromData:(id)a3
{
  unint64_t v3;
  unint64_t v4;
  const __CFString *v5;
  __CFString *v6;
  CFStringEncoding v7;

  v3 = +[CNVCardDataAnalyzer analyzeData:](CNVCardDataAnalyzer, "analyzeData:", a3);
  if (v3)
  {
    if (v3 == 2483028224)
      return 2415919360;
    else
      return v3;
  }
  else
  {
    +[CNVCardUserDefaults vCard21Encoding](CNVCardUserDefaults, "vCard21Encoding");
    v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    v6 = (__CFString *)v5;
    if (!v5
      || (v7 = CFStringConvertIANACharSetNameToEncoding(v5),
          v4 = CFStringConvertEncodingToNSStringEncoding(v7),
          v4 == 0xFFFFFFFF))
    {
      v4 = 30;
    }

  }
  return v4;
}

- (BOOL)parseLine
{
  unint64_t defaultEncoding;
  NSString *grouping;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSString *v10;
  NSString *v11;
  const char *v12;
  const char *v13;
  void *v14;
  NSArray *v15;
  NSArray *itemParameters;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CNVCardUnknownPropertyDescription *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;

  self->_startingPositionOfCurrentProperty = -[CNVCardParser currentPosition](self, "currentPosition");
  defaultEncoding = self->_defaultEncoding;
  *(_WORD *)&self->_quotedPrintable = 0;
  grouping = self->_grouping;
  self->_grouping = 0;
  self->_encoding = defaultEncoding;

  -[CNVCardLexer nextArraySeperatedByToken:stoppingAt:inEncoding:maximumValueLength:](self->_lexer, "nextArraySeperatedByToken:stoppingAt:inEncoding:maximumValueLength:", 256, 46080, 1, -[CNVCardReadingOptions maximumValueLength](self->_options, "maximumValueLength"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (!v6)
  {
    v8 = 0;
LABEL_23:
    v31 = 0;
    goto LABEL_24;
  }
  v7 = v6;
  objc_msgSend(v5, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 == 2)
  {
    objc_msgSend(v5, "objectAtIndex:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (NSString *)objc_msgSend(v9, "copy");
    v11 = self->_grouping;
    self->_grouping = v10;

  }
  if (!v8 || (objc_msgSend(v8, "_cn_caseInsensitiveIsEqual:", CFSTR("END")) & 1) != 0)
    goto LABEL_23;
  if (-[CNVCardTagInclusionPolicy shouldParseTag:](self->_tagInclusionPolicy, "shouldParseTag:", v8)
    && (v12 = -[CNVCardParser parsingSelectorForTag:](self, "parsingSelectorForTag:", v8)) != 0
    && (v13 = v12, (objc_opt_respondsToSelector() & 1) != 0))
  {
    -[CNVCardParser parseParameters](self, "parseParameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (NSArray *)objc_msgSend(v14, "copy");
    itemParameters = self->_itemParameters;
    self->_itemParameters = v15;

    if (!-[CNVCardParser parseValueUsingSelector:](self, "parseValueUsingSelector:", v13))
    {
      +[CNVCardLogging vCard](CNVCardLogging, "vCard");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        -[CNVCardParser parseLine].cold.2((uint64_t)v8, v17, v18, v19, v20, v21, v22, v23);
LABEL_19:

    }
  }
  else if (-[CNVCardTagInclusionPolicy shouldCaptureUnknownTags](self->_tagInclusionPolicy, "shouldCaptureUnknownTags"))
  {
    -[CNVCardParser parseUnknownValueStartingAtPosition:](self, "parseUnknownValueStartingAtPosition:", self->_startingPositionOfCurrentProperty);
    v17 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)objc_opt_class(), "isTagSyntacticallyValid:", v8))
    {
      v24 = objc_alloc_init(CNVCardUnknownPropertyDescription);
      -[CNVCardUnknownPropertyDescription setPropertyName:](v24, "setPropertyName:", v8);
      -[CNVCardUnknownPropertyDescription setOriginalLine:](v24, "setOriginalLine:", v17);
      -[NSMutableArray addObject:](self->_unknowns, "addObject:", v24);
    }
    else
    {
      +[CNVCardLogging vCard](CNVCardLogging, "vCard");
      v24 = (CNVCardUnknownPropertyDescription *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_ERROR))
        -[CNVCardParser parseLine].cold.1((uint64_t)v17, &v24->super, v25, v26, v27, v28, v29, v30);
    }

    goto LABEL_19;
  }
  if (!-[CNVCardLexer advanceToEOL](self->_lexer, "advanceToEOL")
    || !-[CNVCardLexer advancePastEOL](self->_lexer, "advancePastEOL"))
  {
    goto LABEL_23;
  }
  v31 = 1;
LABEL_24:

  return v31;
}

+ (BOOL)isTagSyntacticallyValid:(id)a3
{
  uint64_t v3;
  id v4;
  char v5;

  v3 = isTagSyntacticallyValid__cn_once_token_9;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isTagSyntacticallyValid__cn_once_token_9, &__block_literal_global_309);
  v5 = objc_msgSend(v4, "_cn_containsCharacterInSet:", isTagSyntacticallyValid__cn_once_object_9);

  return v5 ^ 1;
}

void __41__CNVCardParser_isTagSyntacticallyValid___block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-."));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invertedSet");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isTagSyntacticallyValid__cn_once_object_9;
  isTagSyntacticallyValid__cn_once_object_9 = v0;

}

- (SEL)parsingSelectorForTag:(id)a3
{
  return -[CNVCardSelectorMap selectorForString:](self->_parsingSelectorMap, "selectorForString:", a3);
}

- (BOOL)parseValueUsingSelector:(SEL)a3
{
  return ((uint64_t (*)(CNVCardParser *, SEL))-[CNVCardParser methodForSelector:](self, "methodForSelector:"))(self, a3);
}

- (BOOL)parse_ADR
{
  void *v3;
  void *v4;
  NSMutableArray *addresses;
  NSMutableArray *v6;
  NSMutableArray *v7;

  +[CNVCardADRParser valueWithParser:](CNVCardADRParser, "valueWithParser:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[CNVCardParser makeLineWithValue:forProperty:](self, "makeLineWithValue:forProperty:", v3, CFSTR("Address"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    addresses = self->_addresses;
    if (!addresses)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_addresses;
      self->_addresses = v6;

      addresses = self->_addresses;
    }
    -[NSMutableArray addObject:](addresses, "addObject:", v4);

  }
  return 1;
}

- (BOOL)parse_BDAY
{
  NSDateComponents *v3;
  NSDateComponents *bday;

  -[CNVCardDateComponentsParser gregorianDateComponentsWithParser:](self->_dateComponentsParser, "gregorianDateComponentsWithParser:", self);
  v3 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  bday = self->_bday;
  self->_bday = v3;

  return 1;
}

- (BOOL)parse_CALURI
{
  void *v3;
  void *v4;
  NSMutableArray *calendarURIs;
  NSMutableArray *v6;
  NSMutableArray *v7;

  +[CNVCardURLParser valueWithParser:](CNVCardURLParser, "valueWithParser:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
  {
    -[CNVCardParser makeLineWithValue:forProperty:](self, "makeLineWithValue:forProperty:", v3, CFSTR("URLs"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    calendarURIs = self->_calendarURIs;
    if (!calendarURIs)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_calendarURIs;
      self->_calendarURIs = v6;

      calendarURIs = self->_calendarURIs;
    }
    -[NSMutableArray addObject:](calendarURIs, "addObject:", v4);

  }
  return 1;
}

- (BOOL)parse_EMAIL
{
  void *v3;
  void *v4;
  NSMutableArray *emails;
  NSMutableArray *v6;
  NSMutableArray *v7;

  -[CNVCardParser parseRemainingLine](self, "parseRemainingLine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardParser makeLineWithValue:forProperty:](self, "makeLineWithValue:forProperty:", v3, CFSTR("Email"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  emails = self->_emails;
  if (!emails)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_emails;
    self->_emails = v6;

    emails = self->_emails;
  }
  -[NSMutableArray addObject:](emails, "addObject:", v4);
  -[CNVCardParser advancePastSemicolon](self, "advancePastSemicolon");

  return 1;
}

- (BOOL)parse_FN
{
  void *v3;

  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardMutableNameComponents setFormattedName:](self->_nameComponents, "setFormattedName:", v3);

  return 1;
}

- (BOOL)parse_IMPP
{
  CNVCardParser *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = self;
  -[NSArray _cn_firstObjectPassingTest:](self->_itemParameters, "_cn_firstObjectPassingTest:", &__block_literal_global_316);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "values");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  +[CNVCardInstantMessageParser serviceForString:](CNVCardInstantMessageParser, "serviceForString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CNVCardParser parseInstantMessageValueWithService:](v2, "parseInstantMessageValueWithService:", v6);

  return (char)v2;
}

uint64_t __27__CNVCardParser_parse_IMPP__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uppercaseString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("X-SERVICE-TYPE")) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("SERVICE-TYPE"));

  return v4;
}

- (BOOL)parse_N
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardMutableNameComponents setLastName:](self->_nameComponents, "setLastName:", v3);

  -[CNVCardParser advancePastSemicolon](self, "advancePastSemicolon");
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardMutableNameComponents setFirstName:](self->_nameComponents, "setFirstName:", v4);

  -[CNVCardParser advancePastSemicolon](self, "advancePastSemicolon");
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardMutableNameComponents setMiddleName:](self->_nameComponents, "setMiddleName:", v5);

  -[CNVCardParser advancePastSemicolon](self, "advancePastSemicolon");
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardMutableNameComponents setTitle:](self->_nameComponents, "setTitle:", v6);

  -[CNVCardParser advancePastSemicolon](self, "advancePastSemicolon");
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardMutableNameComponents setSuffix:](self->_nameComponents, "setSuffix:", v7);

  v8 = *MEMORY[0x1E0D13848];
  -[CNVCardNameComponents lastName](self->_nameComponents, "lastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(unsigned int (**)(uint64_t, void *))(v8 + 16))(v8, v9))
  {
    -[CNVCardNameComponents firstName](self->_nameComponents, "firstName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (((*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v10) & 1) != 0)
    {
      -[CNVCardNameComponents middleName](self->_nameComponents, "middleName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((*(unsigned int (**)(uint64_t, void *))(v8 + 16))(v8, v11))
      {
        -[CNVCardNameComponents title](self->_nameComponents, "title");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((*(unsigned int (**)(uint64_t, void *))(v8 + 16))(v8, v12))
        {
          -[CNVCardNameComponents suffix](self->_nameComponents, "suffix");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          self->_fullNameHasZeroLength = (*(uint64_t (**)(uint64_t, void *))(v8 + 16))(v8, v13);

        }
        else
        {
          self->_fullNameHasZeroLength = 0;
        }

      }
      else
      {
        self->_fullNameHasZeroLength = 0;
      }

    }
    else
    {
      self->_fullNameHasZeroLength = 0;
    }

  }
  else
  {
    self->_fullNameHasZeroLength = 0;
  }

  return 1;
}

- (BOOL)parse_NICKNAME
{
  void *v3;

  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardParsedResultBuilder setValue:forProperty:](self->_resultBuilder, "setValue:forProperty:", v3, CFSTR("Nickname"));

  return 1;
}

- (BOOL)parse_NOTE
{
  void *v3;
  NSMutableString *v4;
  NSMutableString *notes;

  -[CNVCardParser parseRemainingLine](self, "parseRemainingLine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSMutableString *)objc_msgSend(v3, "mutableCopy");
  notes = self->_notes;
  self->_notes = v4;

  return 1;
}

- (BOOL)parse_ORG
{
  void *v3;
  void *v4;

  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardMutableNameComponents setCompanyName:](self->_nameComponents, "setCompanyName:", v3);

  -[CNVCardParser advancePastSemicolon](self, "advancePastSemicolon");
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardParser reportValue:forProperty:](self, "reportValue:forProperty:", v4, CFSTR("ABDepartment"));

  return 1;
}

- (BOOL)parse_X_PHONETIC_ORG
{
  CNVCardParser *v2;
  void *v3;

  v2 = self;
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CNVCardParsedResultBuilder setValue:forProperty:](v2->_resultBuilder, "setValue:forProperty:", v3, CFSTR("OrganizationPhonetic"));

  return (char)v2;
}

- (BOOL)parse_PHOTO
{
  +[CNVCardPHOTOParser parseBase64:parser:callback:](CNVCardPHOTOParser, "parseBase64:parser:callback:", self->_base64);
  return 1;
}

void __28__CNVCardParser_parse_PHOTO__block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v9 = *(void **)(a1 + 32);
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a2;
  objc_msgSend(v9, "setImageData:", v13);
  objc_msgSend(*(id *)(a1 + 32), "resultBuilder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setValue:forProperty:", v10, CFSTR("memojiMetadata"));

  objc_msgSend(*(id *)(a1 + 32), "resultBuilder");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setImageData:forReference:clipRects:", v13, v12, v11);

}

- (BOOL)parse_X_WALLPAPER
{
  CNVCardParser *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v3, 0);
  LOBYTE(v2) = -[CNVCardParsedResultBuilder setValue:forProperty:](v2->_resultBuilder, "setValue:forProperty:", v4, CFSTR("wallpaper"));

  return (char)v2;
}

- (BOOL)parse_X_WATCH_WALLPAPER_IMAGE_DATA
{
  CNVCardParser *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v3, 0);
  LOBYTE(v2) = -[CNVCardParsedResultBuilder setValue:forProperty:](v2->_resultBuilder, "setValue:forProperty:", v4, CFSTR("watchWallpaperImageData"));

  return (char)v2;
}

- (BOOL)parse_X_IMAGE_BACKGROUND_COLORS_DATA
{
  CNVCardParser *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v3, 0);
  LOBYTE(v2) = -[CNVCardParsedResultBuilder setValue:forProperty:](v2->_resultBuilder, "setValue:forProperty:", v4, CFSTR("imageBackgroundColorsData"));

  return (char)v2;
}

- (BOOL)parse_PRODID
{
  return 1;
}

- (BOOL)parse_REV
{
  return 1;
}

- (BOOL)parse_TEL
{
  void *v3;
  void *v4;
  NSMutableArray *phones;
  NSMutableArray *v6;
  NSMutableArray *v7;

  -[CNVCardParser parseRemainingLine](self, "parseRemainingLine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardParser makeLineWithValue:forProperty:](self, "makeLineWithValue:forProperty:", v3, CFSTR("Phone"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  phones = self->_phones;
  if (!phones)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_phones;
    self->_phones = v6;

    phones = self->_phones;
  }
  -[NSMutableArray addObject:](phones, "addObject:", v4);

  return 1;
}

- (BOOL)parse_TITLE
{
  void *v3;
  char v4;

  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))();
  if ((v4 & 1) == 0)
    -[CNVCardParsedResultBuilder setValue:forProperty:](self->_resultBuilder, "setValue:forProperty:", v3, CFSTR("JobTitle"));

  return v4 ^ 1;
}

- (BOOL)parse_UID
{
  void *v3;
  NSString *v4;
  NSString *carddavUID;
  void *v6;
  void *v7;

  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSString *)objc_msgSend(v3, "copy");
  carddavUID = self->_carddavUID;
  self->_carddavUID = v4;

  if (-[CNVCardLexer peekAtNextToken](self->_lexer, "peekAtNextToken") == 4097)
  {
    -[CNVCardLexer advanceToPeekPoint](self->_lexer, "advanceToPeekPoint");
    -[CNVCardParser parseStringValue](self, "parseStringValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6 && objc_msgSend(v6, "length"))
      -[CNVCardParsedResultBuilder setValue:forProperty:](self->_resultBuilder, "setValue:forProperty:", v7, CFSTR("externalUUID"));
    if (-[CNVCardLexer peekAtNextToken](self->_lexer, "peekAtNextToken") == 4097)
      -[CNVCardLexer advanceToPeekPoint](self->_lexer, "advanceToPeekPoint");

  }
  return 1;
}

- (BOOL)parse_URL
{
  void *v3;
  void *v4;
  NSMutableArray *urls;
  NSMutableArray *v6;
  NSMutableArray *v7;

  +[CNVCardURLParser valueWithParser:](CNVCardURLParser, "valueWithParser:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
  {
    -[CNVCardParser makeLineWithValue:forProperty:](self, "makeLineWithValue:forProperty:", v3, CFSTR("URLs"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    urls = self->_urls;
    if (!urls)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_urls;
      self->_urls = v6;

      urls = self->_urls;
    }
    -[NSMutableArray addObject:](urls, "addObject:", v4);

  }
  return 1;
}

- (BOOL)parse_VERSION
{
  void *v3;
  char v4;

  -[CNVCardParser parseRemainingLine](self, "parseRemainingLine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))();
  if ((v4 & 1) == 0)
    self->_30vCard = objc_msgSend(v3, "_cn_caseInsensitiveIsEqual:", CFSTR("3.0"));

  return v4 ^ 1;
}

- (BOOL)parse_X_ABADR
{
  return -[CNVCardParser parseExtension:](self, "parseExtension:", CFSTR("X-ABADR"));
}

- (BOOL)parse_X_ABDATE
{
  void *v3;
  void *v4;
  NSMutableArray *dateComponents;
  NSMutableArray *v6;
  NSMutableArray *v7;

  -[CNVCardDateComponentsParser gregorianDateComponentsWithParser:](self->_dateComponentsParser, "gregorianDateComponentsWithParser:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CNVCardParser makeLineWithValue:forProperty:](self, "makeLineWithValue:forProperty:", v3, CFSTR("ABDateComponents"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    dateComponents = self->_dateComponents;
    if (!dateComponents)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_dateComponents;
      self->_dateComponents = v6;

      dateComponents = self->_dateComponents;
    }
    -[NSMutableArray addObject:](dateComponents, "addObject:", v4);

  }
  return 1;
}

- (BOOL)parse_X_ABLABEL
{
  return -[CNVCardParser parseExtension:](self, "parseExtension:", CFSTR("X-ABLabel"));
}

- (BOOL)parse_X_ABORDER
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  CNVCardParsedResultBuilder *resultBuilder;
  void *v14;

  -[CNVCardLexer nextArraySeperatedByToken:stoppingAt:inEncoding:maximumValueLength:](self->_lexer, "nextArraySeperatedByToken:stoppingAt:inEncoding:maximumValueLength:", 4096, 0x8000, self->_encoding, -[CNVCardReadingOptions maximumValueLength](self->_options, "maximumValueLength"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    -[CNVCardParsedResultBuilder valueForProperty:](self->_resultBuilder, "valueForProperty:", CFSTR("ABPersonFlags"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    v7 = +[CNVCardUserDefaults defaultNameOrdering](CNVCardUserDefaults, "defaultNameOrdering");
    objc_msgSend(v3, "objectAtIndex:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 == 32)
    {
      v10 = objc_msgSend(v8, "compare:options:", CFSTR("LAST"), 1);

      v11 = v6 & 0xFFFFFFFFFFFFFFC7 | 0x10;
    }
    else
    {
      v10 = objc_msgSend(v8, "compare:options:", CFSTR("FIRST"), 1);

      v11 = v6 & 0xFFFFFFFFFFFFFFC7 | 0x20;
    }
    if (v10)
      v12 = v6;
    else
      v12 = v11;
    resultBuilder = self->_resultBuilder;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardParsedResultBuilder setValue:forProperty:](resultBuilder, "setValue:forProperty:", v14, CFSTR("ABPersonFlags"));

  }
  return v4 != 0;
}

- (BOOL)parse_X_ABPHOTO
{
  void *v3;
  void *v4;

  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVCardXABPHOTOParser valueWithName:](CNVCardXABPHOTOParser, "valueWithName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[CNVCardParsedResultBuilder setImageData:forReference:clipRects:](self->_resultBuilder, "setImageData:forReference:clipRects:", v4, &stru_1E95708D8, MEMORY[0x1E0C9AA60]);

  return v4 != 0;
}

- (BOOL)parse_X_AIM
{
  return -[CNVCardParser parseInstantMessageValueWithService:](self, "parseInstantMessageValueWithService:", CFSTR("AIMInstant"));
}

- (BOOL)parse_X_AIM_ID
{
  return -[CNVCardParser parseInstantMessageValueWithService:](self, "parseInstantMessageValueWithService:", CFSTR("AIMInstant"));
}

- (BOOL)parse_X_ABRELATEDNAMES
{
  void *v3;
  void *v4;
  NSMutableArray *relatedNames;
  NSMutableArray *v6;
  NSMutableArray *v7;

  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
  {
    -[CNVCardParser makeLineWithValue:forProperty:](self, "makeLineWithValue:forProperty:", v3, CFSTR("ABRelatedNames"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    relatedNames = self->_relatedNames;
    if (!relatedNames)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_relatedNames;
      self->_relatedNames = v6;

      relatedNames = self->_relatedNames;
    }
    -[NSMutableArray addObject:](relatedNames, "addObject:", v4);

  }
  return 1;
}

- (BOOL)parse_X_ABSHOWAS
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  CNVCardParsedResultBuilder *resultBuilder;
  void *v10;

  -[CNVCardLexer nextArraySeperatedByToken:stoppingAt:inEncoding:maximumValueLength:](self->_lexer, "nextArraySeperatedByToken:stoppingAt:inEncoding:maximumValueLength:", 4096, 0x8000, self->_encoding, -[CNVCardReadingOptions maximumValueLength](self->_options, "maximumValueLength"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "compare:options:", CFSTR("COMPANY"), 1);

    if (!v6)
    {
      -[CNVCardParsedResultBuilder valueForProperty:](self->_resultBuilder, "valueForProperty:", CFSTR("ABPersonFlags"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "integerValue");

      resultBuilder = self->_resultBuilder;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8 & 0xFFFFFFFFFFFFFFF8 | 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CNVCardParsedResultBuilder setValue:forProperty:](resultBuilder, "setValue:forProperty:", v10, CFSTR("ABPersonFlags"));

    }
  }

  return v4 != 0;
}

- (BOOL)parse_X_ABUID
{
  void *v3;
  NSString *v4;
  NSString *uid;

  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (NSString *)objc_msgSend(v3, "copy");
  uid = self->_uid;
  self->_uid = v4;

  return (*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() ^ 1;
}

- (BOOL)parse_X_ACTIVITY_ALERT
{
  void *v3;
  NSMutableDictionary *activityAlerts;
  NSMutableDictionary *v5;
  NSMutableDictionary *v6;

  +[CNVCardXACTIVITYALERTParser valueWithParser:](CNVCardXACTIVITYALERTParser, "valueWithParser:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    activityAlerts = self->_activityAlerts;
    if (!activityAlerts)
    {
      v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v6 = self->_activityAlerts;
      self->_activityAlerts = v5;

      activityAlerts = self->_activityAlerts;
    }
    -[NSMutableDictionary addEntriesFromDictionary:](activityAlerts, "addEntriesFromDictionary:", v3);
  }

  return 1;
}

- (BOOL)parse_X_ALTBDAY
{
  NSDateComponents *v3;
  NSDateComponents *altBday;

  -[CNVCardDateComponentsParser dateComponentsWithParser:](self->_dateComponentsParser, "dateComponentsWithParser:", self);
  v3 = (NSDateComponents *)objc_claimAutoreleasedReturnValue();
  altBday = self->_altBday;
  self->_altBday = v3;

  return 1;
}

- (BOOL)parse_X_APPLE_SUBADMINISTRATIVEAREA
{
  return -[CNVCardParser parseExtension:](self, "parseExtension:", CFSTR("X-APPLE-SUBADMINISTRATIVEAREA"));
}

- (BOOL)parse_X_APPLE_SUBLOCALITY
{
  return -[CNVCardParser parseExtension:](self, "parseExtension:", CFSTR("X-APPLE-SUBLOCALITY"));
}

- (BOOL)parse_X_GOOGLE_ID
{
  return -[CNVCardParser parseInstantMessageValueWithService:](self, "parseInstantMessageValueWithService:", CFSTR("GoogleTalkInstant"));
}

- (BOOL)parse_X_GOOGLE_TALK
{
  return -[CNVCardParser parseInstantMessageValueWithService:](self, "parseInstantMessageValueWithService:", CFSTR("GoogleTalkInstant"));
}

- (BOOL)parse_X_GTALK
{
  return -[CNVCardParser parseInstantMessageValueWithService:](self, "parseInstantMessageValueWithService:", CFSTR("GoogleTalkInstant"));
}

- (BOOL)parse_X_ICQ
{
  return -[CNVCardParser parseInstantMessageValueWithService:](self, "parseInstantMessageValueWithService:", CFSTR("ICQInstant"));
}

- (BOOL)parse_X_ICQ_ID
{
  return -[CNVCardParser parseInstantMessageValueWithService:](self, "parseInstantMessageValueWithService:", CFSTR("ICQInstant"));
}

- (BOOL)parse_X_IMAGEHASH
{
  CNVCardParser *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v3, 0);
  LOBYTE(v2) = -[CNVCardParsedResultBuilder setValue:forProperty:](v2->_resultBuilder, "setValue:forProperty:", v4, CFSTR("imageHash"));

  return (char)v2;
}

- (BOOL)parse_X_IMAGETYPE
{
  CNVCardParser *v2;
  void *v3;

  v2 = self;
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CNVCardParsedResultBuilder setValue:forProperty:](v2->_resultBuilder, "setValue:forProperty:", v3, CFSTR("imageType"));

  return (char)v2;
}

- (BOOL)parse_X_JABBER
{
  return -[CNVCardParser parseInstantMessageValueWithService:](self, "parseInstantMessageValueWithService:", CFSTR("JabberInstant"));
}

- (BOOL)parse_X_JABBER_ID
{
  return -[CNVCardParser parseInstantMessageValueWithService:](self, "parseInstantMessageValueWithService:", CFSTR("JabberInstant"));
}

- (BOOL)parse_X_MAIDENNAME
{
  CNVCardParser *v2;
  void *v3;

  v2 = self;
  -[CNVCardParser parseRemainingLine](self, "parseRemainingLine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CNVCardParsedResultBuilder setValue:forProperty:](v2->_resultBuilder, "setValue:forProperty:", v3, CFSTR("MaidenName"));

  return (char)v2;
}

- (BOOL)parse_X_MSN
{
  return -[CNVCardParser parseInstantMessageValueWithService:](self, "parseInstantMessageValueWithService:", CFSTR("MSNInstant"));
}

- (BOOL)parse_X_MSN_ID
{
  return -[CNVCardParser parseInstantMessageValueWithService:](self, "parseInstantMessageValueWithService:", CFSTR("MSNInstant"));
}

- (BOOL)parse_X_PHONETIC_FIRST_NAME
{
  CNVCardParser *v2;
  void *v3;

  v2 = self;
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CNVCardParsedResultBuilder setValue:forProperty:](v2->_resultBuilder, "setValue:forProperty:", v3, CFSTR("FirstPhonetic"));

  return (char)v2;
}

- (BOOL)parse_X_PHONETIC_LAST_NAME
{
  CNVCardParser *v2;
  void *v3;

  v2 = self;
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CNVCardParsedResultBuilder setValue:forProperty:](v2->_resultBuilder, "setValue:forProperty:", v3, CFSTR("LastPhonetic"));

  return (char)v2;
}

- (BOOL)parse_X_PHONETIC_MIDDLE_NAME
{
  CNVCardParser *v2;
  void *v3;

  v2 = self;
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CNVCardParsedResultBuilder setValue:forProperty:](v2->_resultBuilder, "setValue:forProperty:", v3, CFSTR("MiddlePhonetic"));

  return (char)v2;
}

- (BOOL)parse_X_PRONUNCIATION_FIRST_NAME
{
  CNVCardParser *v2;
  void *v3;

  v2 = self;
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CNVCardParsedResultBuilder setValue:forProperty:](v2->_resultBuilder, "setValue:forProperty:", v3, CFSTR("FirstPronunciation"));

  return (char)v2;
}

- (BOOL)parse_X_PRONUNCIATION_LAST_NAME
{
  CNVCardParser *v2;
  void *v3;

  v2 = self;
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CNVCardParsedResultBuilder setValue:forProperty:](v2->_resultBuilder, "setValue:forProperty:", v3, CFSTR("LastPronunciation"));

  return (char)v2;
}

- (BOOL)parse_X_ADDRESSING_GRAMMAR
{
  void *v3;
  void *v4;
  NSMutableArray *addressingGrammars;
  NSMutableArray *v6;
  NSMutableArray *v7;

  -[CNVCardParser parseRemainingLine](self, "parseRemainingLine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardParser makeLineWithValue:forProperty:](self, "makeLineWithValue:forProperty:", v3, CFSTR("AddressingGrammar"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  addressingGrammars = self->_addressingGrammars;
  if (!addressingGrammars)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = self->_addressingGrammars;
    self->_addressingGrammars = v6;

    addressingGrammars = self->_addressingGrammars;
  }
  -[NSMutableArray addObject:](addressingGrammars, "addObject:", v4);

  return 1;
}

- (BOOL)parse_X_QQ
{
  return -[CNVCardParser parseInstantMessageValueWithService:](self, "parseInstantMessageValueWithService:", CFSTR("QQInstant"));
}

- (BOOL)parse_X_QQ_ID
{
  return -[CNVCardParser parseInstantMessageValueWithService:](self, "parseInstantMessageValueWithService:", CFSTR("QQInstant"));
}

- (BOOL)parse_X_SKYPE
{
  return -[CNVCardParser parseInstantMessageValueWithService:](self, "parseInstantMessageValueWithService:", CFSTR("SkypeInstant"));
}

- (BOOL)parse_X_SKYPE_ID
{
  return -[CNVCardParser parseInstantMessageValueWithService:](self, "parseInstantMessageValueWithService:", CFSTR("SkypeInstant"));
}

- (BOOL)parse_X_SKYPE_USERNAME
{
  return -[CNVCardParser parseInstantMessageValueWithService:](self, "parseInstantMessageValueWithService:", CFSTR("SkypeInstant"));
}

- (BOOL)parse_X_SOCIALPROFILE
{
  void *v3;
  void *v4;
  NSMutableArray *socialProfiles;
  NSMutableArray *v6;
  NSMutableArray *v7;

  +[CNVCardXSOCIALPROFILEParser valueWithParser:](CNVCardXSOCIALPROFILEParser, "valueWithParser:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13820] + 16))() & 1) == 0)
  {
    -[CNVCardParser makeLineWithValue:forProperty:](self, "makeLineWithValue:forProperty:", v3, CFSTR("SocialProfile"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    socialProfiles = self->_socialProfiles;
    if (!socialProfiles)
    {
      v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v7 = self->_socialProfiles;
      self->_socialProfiles = v6;

      socialProfiles = self->_socialProfiles;
    }
    -[NSMutableArray addObject:](socialProfiles, "addObject:", v4);

  }
  return 1;
}

- (BOOL)parse_X_YAHOO
{
  return -[CNVCardParser parseInstantMessageValueWithService:](self, "parseInstantMessageValueWithService:", CFSTR("YahooInstant"));
}

- (BOOL)parse_X_YAHOO_ID
{
  return -[CNVCardParser parseInstantMessageValueWithService:](self, "parseInstantMessageValueWithService:", CFSTR("YahooInstant"));
}

- (BOOL)parse_X_ADDRESSBOOKSERVER_PHONEME_DATA
{
  CNVCardParser *v2;
  void *v3;

  v2 = self;
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CNVCardParsedResultBuilder setValue:forProperty:](v2->_resultBuilder, "setValue:forProperty:", v3, CFSTR("PhonemeData"));

  return (char)v2;
}

- (BOOL)parse_X_APPLE_LIKENESS_SOURCE
{
  CNVCardParser *v2;
  void *v3;

  v2 = self;
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CNVCardParsedResultBuilder setValue:forProperty:](v2->_resultBuilder, "setValue:forProperty:", v3, CFSTR("PreferredLikenessSource"));

  return (char)v2;
}

- (BOOL)parse_X_APPLE_LIKENESS_SERVICE_IDENTIFIER
{
  CNVCardParser *v2;
  void *v3;

  v2 = self;
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = -[CNVCardParsedResultBuilder setValue:forProperty:](v2->_resultBuilder, "setValue:forProperty:", v3, CFSTR("PreferredApplePersonaIdentifier"));

  return (char)v2;
}

- (BOOL)parse_X_APPLE_GUARDIAN_WHITELISTED
{
  void *v3;
  char v4;

  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("false")) & 1) != 0)
    v4 = 1;
  else
    v4 = -[CNVCardParsedResultBuilder setValue:forProperty:](self->_resultBuilder, "setValue:forProperty:", v3, CFSTR("GuardianWhitelisted"));

  return v4;
}

- (BOOL)parse_X_SHARED_PHOTO_DISPLAY_PREF
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  CNVCardParsedResultBuilder *resultBuilder;
  void *v15;

  -[CNVCardLexer nextArraySeperatedByToken:stoppingAt:inEncoding:maximumValueLength:](self->_lexer, "nextArraySeperatedByToken:stoppingAt:inEncoding:maximumValueLength:", 4096, 0x8000, self->_encoding, -[CNVCardReadingOptions maximumValueLength](self->_options, "maximumValueLength"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    -[CNVCardParsedResultBuilder valueForProperty:](self->_resultBuilder, "valueForProperty:", CFSTR("ABPersonFlags"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "integerValue");

    objc_msgSend(v3, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "compare:options:", CFSTR("AUTOUPDATE"), 1);

    if (v8)
    {
      objc_msgSend(v3, "objectAtIndex:", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "compare:options:", CFSTR("ALWAYS_ASK"), 1);

      if (v10)
      {
        objc_msgSend(v3, "objectAtIndex:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "compare:options:", CFSTR("IMPLICIT_AUTOUPDATE"), 1);

        if (v12)
          v13 = v6 & 0xFFFFFFFFFFFFFF3FLL;
        else
          v13 = v6 | 0xC0;
      }
      else
      {
        v13 = v6 & 0xFFFFFFFFFFFFFF3FLL | 0x80;
      }
    }
    else
    {
      v13 = v6 & 0xFFFFFFFFFFFFFF3FLL | 0x40;
    }
    resultBuilder = self->_resultBuilder;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardParsedResultBuilder setValue:forProperty:](resultBuilder, "setValue:forProperty:", v15, CFSTR("ABPersonFlags"));

  }
  return v4 != 0;
}

- (BOOL)parse_VND_63_SENSITIVE_CONTENT_CONFIG
{
  CNVCardParser *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[CNVCardParser parseStringValue](self, "parseStringValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v3, 0);
  LOBYTE(v2) = -[CNVCardParsedResultBuilder setValue:forProperty:](v2->_resultBuilder, "setValue:forProperty:", v4, CFSTR("sensitiveContentConfiguration"));

  return (char)v2;
}

- (BOOL)parseInstantMessageValueWithService:(id)a3
{
  void *v4;
  void *v5;
  NSMutableArray *instantMessagingAddresses;
  NSMutableArray *v7;
  NSMutableArray *v8;

  +[CNVCardInstantMessageParser valueWithService:existingHandles:parser:](CNVCardInstantMessageParser, "valueWithService:existingHandles:parser:", a3, self->_instantMessagingAddresses, self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CNVCardParser makeLineWithValue:forProperty:](self, "makeLineWithValue:forProperty:", v4, CFSTR("InstantMessage"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    instantMessagingAddresses = self->_instantMessagingAddresses;
    if (!instantMessagingAddresses)
    {
      v7 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = self->_instantMessagingAddresses;
      self->_instantMessagingAddresses = v7;

      instantMessagingAddresses = self->_instantMessagingAddresses;
    }
    -[NSMutableArray addObject:](instantMessagingAddresses, "addObject:", v5);

  }
  return 1;
}

- (BOOL)parseExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CNVCardParser parseArrayValue](self, "parseArrayValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && ((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
  {
    -[NSMutableDictionary objectForKey:](self->_extensions, "objectForKey:", self->_grouping);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKey:](self->_extensions, "setObject:forKey:", v6, self->_grouping);
    }
    objc_msgSend(v6, "setObject:forKey:", v5, v4);

  }
  return 1;
}

- (id)firstValueForKey:(id)a3 inExtensionGroup:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    -[NSMutableDictionary objectForKey:](self->_extensions, "objectForKey:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardParser firstValueForKey:inExtension:](self, "firstValueForKey:inExtension:", v6, v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (id)firstValueForKey:(id)a3 inExtension:(id)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a4, "objectForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)firstParameterWithName:(id)a3
{
  id v4;
  NSArray *itemParameters;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  itemParameters = self->_itemParameters;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __40__CNVCardParser_firstParameterWithName___block_invoke;
  v9[3] = &unk_1E956F7B8;
  v10 = v4;
  v6 = v4;
  -[NSArray _cn_firstObjectPassingTest:](itemParameters, "_cn_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __40__CNVCardParser_firstParameterWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_cn_caseInsensitiveIsEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (id)firstValueForParameterWithName:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[CNVCardParser firstParameterWithName:](self, "firstParameterWithName:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "values");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if ((*(unsigned int (**)(void))(*MEMORY[0x1E0D13848] + 16))())
      v7 = 0;
    else
      v7 = v6;
    v8 = v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)typeParameters
{
  if (self->_30vCard)
    -[CNVCardParser parameterValuesForName:](self, "parameterValuesForName:", CFSTR("TYPE"));
  else
    -[NSArray _cn_map:](self->_itemParameters, "_cn_map:", &__block_literal_global_353);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __31__CNVCardParser_typeParameters__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "name");
}

- (id)parameterValuesForName:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_itemParameters;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "name", (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", v4);

        if (v13)
        {
          objc_msgSend(v11, "values");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v14);

        }
      }
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)makeLineWithValue:(id)a3 forProperty:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CNVCardParser genericLabelForProperty:](self, "genericLabelForProperty:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardParser makeLineWithLabel:value:](self, "makeLineWithLabel:value:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)makeLineWithLabel:(id)a3 value:(id)a4
{
  id v6;
  id v7;
  CNVCardParsedLine *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[CNVCardParsedLine initWithName:]([CNVCardParsedLine alloc], "initWithName:", v7);

  -[CNVCardParsedLine setValue:](v8, "setValue:", v6);
  -[CNVCardParsedLine setParameters:](v8, "setParameters:", self->_itemParameters);
  -[CNVCardParsedLine setGrouping:](v8, "setGrouping:", self->_grouping);
  -[CNVCardParsedLine setIsPrimary:](v8, "setIsPrimary:", -[NSArray _cn_any:](self->_itemParameters, "_cn_any:", &__block_literal_global_355));
  return v8;
}

- (id)parseParameters
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  void (*v11)(CNVCardParser *, const char *, void *);
  id v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CNVCardLexer readNextToken](self->_lexer, "readNextToken");
  if (v4 == 8193)
  {
LABEL_15:
    v12 = v3;
  }
  else
  {
    v5 = v4;
    while (-[CNVCardLexer errorCount](self->_lexer, "errorCount") <= 10)
    {
      if (v5 == 4097)
      {
        -[CNVCardParser nextParameterInCurrentLine](self, "nextParameterInCurrentLine");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v6);
        objc_msgSend(v6, "name");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = -[CNVCardParser handlerSelectorForParameterName:](self, "handlerSelectorForParameterName:", v7);

        if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v6, "values");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "firstObject");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = (void (*)(CNVCardParser *, const char *, void *))-[CNVCardParser methodForSelector:](self, "methodForSelector:", v8);
          if (v11)
            v11(self, v8, v10);

        }
      }
      else if (v5 == 32769 || v5 == 65537)
      {
        goto LABEL_15;
      }
      v5 = -[CNVCardLexer readNextToken](self->_lexer, "readNextToken");
      if (v5 == 8193)
        goto LABEL_15;
    }
    v12 = 0;
  }

  return v12;
}

- (id)nextParameterInCurrentLine
{
  __CFString *v3;
  void *v4;
  int v5;
  int v6;
  void *v7;
  void *v8;

  -[CNVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:maximumValueLength:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:maximumValueLength:", 1, 0, 46080, 1, -[CNVCardReadingOptions maximumValueLength](self->_options, "maximumValueLength"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if ((-[__CFString _cn_caseInsensitiveIsEqual:](v3, "_cn_caseInsensitiveIsEqual:", CFSTR("QUOTED-PRINTABLE")) & 1) != 0)
  {
    v4 = &unk_1E957CF00;
  }
  else
  {
    if (!-[__CFString _cn_caseInsensitiveIsEqual:](v3, "_cn_caseInsensitiveIsEqual:", CFSTR("BASE64")))
    {
      v4 = 0;
      v5 = 1;
      goto LABEL_7;
    }
    v4 = &unk_1E957CF18;
  }

  v5 = 0;
  v3 = CFSTR("ENCODING");
LABEL_7:
  v6 = -[CNVCardLexer peekAtNextToken](self->_lexer, "peekAtNextToken");
  if (v5 && v6 == 1025)
  {
    -[CNVCardParser parseParameterValues](self, "parseParameterValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (v4)
    v7 = v4;
  else
    v7 = (void *)MEMORY[0x1E0C9AA60];
  +[CNVCardParsedParameter parameterWithName:values:](CNVCardParsedParameter, "parameterWithName:values:", v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)parseParameterValues
{
  uint64_t v3;
  void *v4;
  void *v5;

  -[CNVCardLexer advanceToPeekPoint](self->_lexer, "advanceToPeekPoint");
  if (self->_quotedPrintable)
    v3 = 46080;
  else
    v3 = 45056;
  -[CNVCardLexer nextArraySeperatedByToken:stoppingAt:inEncoding:maximumValueLength:](self->_lexer, "nextArraySeperatedByToken:stoppingAt:inEncoding:maximumValueLength:", 128, v3, 4, -[CNVCardReadingOptions maximumValueLength](self->_options, "maximumValueLength"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_cn_map:", &__block_literal_global);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (SEL)handlerSelectorForParameterName:(id)a3
{
  return -[CNVCardSelectorMap selectorForString:](self->_parameterSelectorMap, "selectorForString:", a3);
}

- (void)parameter_QUOTED_PRINTABLE:(id)a3
{
  self->_quotedPrintable = 1;
}

- (void)parameter_BASE64:(id)a3
{
  self->_base64 = 1;
}

- (void)parameter_CHARSET:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  unint64_t v6;
  CFStringEncoding v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v4 = (__CFString *)a3;
  v5 = v4;
  if (!v4)
  {
    v6 = 4;
    goto LABEL_7;
  }
  if (-[__CFString _cn_caseInsensitiveIsEqual:](v4, "_cn_caseInsensitiveIsEqual:", CFSTR("UTF-7")))
  {
    v6 = 4000100;
LABEL_7:
    self->_encoding = v6;
    goto LABEL_8;
  }
  if (-[__CFString _cn_caseInsensitiveIsEqual:](v5, "_cn_caseInsensitiveIsEqual:", CFSTR("shift_jis")))
  {
    v6 = 8;
    goto LABEL_7;
  }
  v7 = CFStringConvertIANACharSetNameToEncoding(v5);
  self->_encoding = v7;
  if (v7 == -1)
  {
    +[CNVCardLogging vCard](CNVCardLogging, "vCard");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CNVCardParser parameter_CHARSET:].cold.1((uint64_t)v5, v8, v9, v10, v11, v12, v13, v14);

  }
  else
  {
    self->_encoding = CFStringConvertEncodingToNSStringEncoding(v7);
  }
LABEL_8:

}

- (void)parameter_ENCODING:(id)a3
{
  uint64_t v4;
  void *v5;
  int v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "_cn_caseInsensitiveIsEqual:", CFSTR("QUOTED-PRINTABLE")) & 1) != 0)
  {
    v4 = 312;
LABEL_5:
    v5 = v7;
    goto LABEL_6;
  }
  if ((objc_msgSend(v7, "_cn_caseInsensitiveIsEqual:", CFSTR("b")) & 1) != 0)
  {
    v4 = 313;
    goto LABEL_5;
  }
  v6 = objc_msgSend(v7, "_cn_caseInsensitiveIsEqual:", CFSTR("BASE64"));
  v5 = v7;
  if (!v6)
    goto LABEL_7;
  v4 = 313;
LABEL_6:
  *((_BYTE *)&self->super.isa + v4) = 1;
LABEL_7:

}

- (void)reportValues
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 fullNameHasZeroLength;
  uint64_t v12;
  CNVCardParsedResultBuilder *resultBuilder;
  void *v14;

  v3 = *MEMORY[0x1E0D13848];
  if (((*(uint64_t (**)(_QWORD, NSString *))(*MEMORY[0x1E0D13848] + 16))(*MEMORY[0x1E0D13848], self->_uid) & 1) == 0)
    -[CNVCardParser reportValue:forProperty:](self, "reportValue:forProperty:", self->_uid, CFSTR("UID"));
  -[CNVCardParser processNameValues](self, "processNameValues");
  -[CNVCardParser processExtensionValues](self, "processExtensionValues");
  -[CNVCardNameComponents firstName](self->_nameComponents, "firstName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardParser reportValue:forProperty:](self, "reportValue:forProperty:", v4, CFSTR("First"));

  -[CNVCardNameComponents lastName](self->_nameComponents, "lastName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardParser reportValue:forProperty:](self, "reportValue:forProperty:", v5, CFSTR("Last"));

  -[CNVCardNameComponents middleName](self->_nameComponents, "middleName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardParser reportValue:forProperty:](self, "reportValue:forProperty:", v6, CFSTR("Middle"));

  -[CNVCardNameComponents title](self->_nameComponents, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardParser reportValue:forProperty:](self, "reportValue:forProperty:", v7, CFSTR("Title"));

  -[CNVCardNameComponents suffix](self->_nameComponents, "suffix");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardParser reportValue:forProperty:](self, "reportValue:forProperty:", v8, CFSTR("Suffix"));

  -[CNVCardNameComponents companyName](self->_nameComponents, "companyName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardParser reportValue:forProperty:](self, "reportValue:forProperty:", v9, CFSTR("Organization"));

  -[CNVCardNameComponents companyName](self->_nameComponents, "companyName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(uint64_t, void *))(v3 + 16))(v3, v10) & 1) != 0)
    goto LABEL_6;
  fullNameHasZeroLength = self->_fullNameHasZeroLength;

  if (fullNameHasZeroLength)
  {
    -[CNVCardParsedResultBuilder valueForProperty:](self->_resultBuilder, "valueForProperty:", CFSTR("ABPersonFlags"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "integerValue");
    resultBuilder = self->_resultBuilder;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v12 & 0xFFFFFFFFFFFFFFF8 | 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVCardParsedResultBuilder setValue:forProperty:](resultBuilder, "setValue:forProperty:", v14, CFSTR("ABPersonFlags"));

LABEL_6:
  }
  -[CNVCardParser reportValue:forProperty:](self, "reportValue:forProperty:", self->_bday, CFSTR("BirthdayComponents"));
  -[CNVCardParser reportValue:forProperty:](self, "reportValue:forProperty:", self->_altBday, CFSTR("AlternateBirthdayComponents"));
  -[CNVCardParser reportValue:forProperty:](self, "reportValue:forProperty:", self->_notes, CFSTR("Note"));
  -[CNVCardParser reportMultiValueLines:forProperty:](self, "reportMultiValueLines:forProperty:", self->_emails, CFSTR("Email"));
  -[CNVCardParser reportMultiValueLines:forProperty:](self, "reportMultiValueLines:forProperty:", self->_phones, CFSTR("Phone"));
  -[CNVCardParser reportMultiValueLines:forProperty:](self, "reportMultiValueLines:forProperty:", self->_addresses, CFSTR("Address"));
  -[CNVCardParser reportMultiValueLines:forProperty:](self, "reportMultiValueLines:forProperty:", self->_instantMessagingAddresses, CFSTR("InstantMessage"));
  -[CNVCardParser reportMultiValueLines:forProperty:](self, "reportMultiValueLines:forProperty:", self->_socialProfiles, CFSTR("SocialProfile"));
  -[CNVCardParser reportMultiValueLines:forProperty:](self, "reportMultiValueLines:forProperty:", self->_dateComponents, CFSTR("ABDateComponents"));
  -[CNVCardParser reportMultiValueLines:forProperty:](self, "reportMultiValueLines:forProperty:", self->_relatedNames, CFSTR("ABRelatedNames"));
  -[CNVCardParser reportMultiValueLines:forProperty:](self, "reportMultiValueLines:forProperty:", self->_urls, CFSTR("URLs"));
  -[CNVCardParser reportMultiValueLines:forProperty:](self, "reportMultiValueLines:forProperty:", self->_calendarURIs, CFSTR("calendarURIs"));
  -[CNVCardParser reportMultiValueLines:forProperty:](self, "reportMultiValueLines:forProperty:", self->_addressingGrammars, CFSTR("AddressingGrammar"));
  -[CNVCardParser reportValue:forProperty:](self, "reportValue:forProperty:", self->_activityAlerts, CFSTR("ActivityAlert"));
  if (((*(uint64_t (**)(uint64_t, NSString *))(v3 + 16))(v3, self->_carddavUID) & 1) == 0
    && -[CNVCardParsedResultBuilder canSetValueForProperty:](self->_resultBuilder, "canSetValueForProperty:", CFSTR("externalUUID")))
  {
    -[CNVCardParsedResultBuilder setValue:forProperty:](self->_resultBuilder, "setValue:forProperty:", self->_carddavUID, CFSTR("externalUUID"));
  }
  if (-[NSMutableArray count](self->_unknowns, "count"))
    -[CNVCardParsedResultBuilder setUnknownProperties:](self->_resultBuilder, "setUnknownProperties:", self->_unknowns);
}

- (void)processNameValues
{
  +[CNVCardNameComponentPostProcessor postProcessNameComponents:](_TtC5vCard33CNVCardNameComponentPostProcessor, "postProcessNameComponents:", self->_nameComponents);
}

- (void)processExtensionValues
{
  NSMutableArray *addresses;
  void *v4;

  addresses = self->_addresses;
  -[CNVCardParser validCountryCodes](self, "validCountryCodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[CNVCardADRParser processExtensionValuesForLines:validCountryCodes:parser:](CNVCardADRParser, "processExtensionValuesForLines:validCountryCodes:parser:", addresses, v4, self);

  +[CNVCardXSOCIALPROFILEParser processExtensionValuesForLines:parser:](CNVCardXSOCIALPROFILEParser, "processExtensionValuesForLines:parser:", self->_socialProfiles, self);
}

- (void)reportValue:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (!-[CNVCardParser valueIsEmpty:](self, "valueIsEmpty:", v7))
    -[CNVCardParsedResultBuilder setValue:forProperty:](self->_resultBuilder, "setValue:forProperty:", v7, v6);

}

- (void)reportMultiValueLines:(id)a3 forProperty:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v23 = v7;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v22 = v6;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v29;
      v11 = *MEMORY[0x1E0D13848];
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v10)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v13, "value", v22);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[CNVCardParser valueIsEmpty:](self, "valueIsEmpty:", v14))
          {
            objc_msgSend(v13, "grouping");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            -[CNVCardParser firstValueForKey:inExtensionGroup:](self, "firstValueForKey:inExtensionGroup:", CFSTR("X-ABLabel"), v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if ((*(unsigned int (**)(uint64_t, void *))(v11 + 16))(v11, v16))
            {
              objc_msgSend(v13, "name");
              v17 = objc_claimAutoreleasedReturnValue();

              v16 = (void *)v17;
            }
            if (-[CNVCardParser valueIsEmpty:](self, "valueIsEmpty:", v16))
            {
              -[CNVCardParser fallbackLabelForProperty:](self, "fallbackLabelForProperty:", v23);
              v18 = objc_claimAutoreleasedReturnValue();

              v16 = (void *)v18;
            }
            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "_cn_addObject:orPlaceholder:", v14, v19);

            objc_msgSend(MEMORY[0x1E0C99E38], "null");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "_cn_addObject:orPlaceholder:", v16, v20);

            if (objc_msgSend(v13, "isPrimary"))
              v21 = MEMORY[0x1E0C9AAB0];
            else
              v21 = MEMORY[0x1E0C9AAA0];
            objc_msgSend(v24, "addObject:", v21);

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v9);
    }

    v7 = v23;
    -[CNVCardParsedResultBuilder setValues:labels:isPrimaries:forProperty:](self->_resultBuilder, "setValues:labels:isPrimaries:forProperty:", v26, v25, v24, v23);

    v6 = v22;
  }

}

- (BOOL)valueIsEmpty:(id)a3
{
  id v3;
  id v4;
  BOOL v6;

  v3 = a3;
  v6 = 1;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v4 = (id)objc_claimAutoreleasedReturnValue();

    if (v4 != v3 && *MEMORY[0x1E0C9B0D0] != (_QWORD)v3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) == 0)
        v6 = 0;
    }
  }

  return v6;
}

- (id)validCountryCodes
{
  return (id)-[CNVCardParsedResultBuilder validCountryCodes](self->_resultBuilder, "validCountryCodes");
}

- (id)genericLabelForProperty:(id)a3
{
  id v4;
  __CFString *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __CFString *v13;
  __CFString **v14;
  CNVCardParser *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Phone")))
  {
    -[CNVCardParser phoneLabel](self, "phoneLabel");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CNVCardParser typeParameters](self, "typeParameters");
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v18;
      v16 = self;
LABEL_5:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        if ((objc_msgSend(v11, "_cn_caseInsensitiveIsEqual:", CFSTR("HOME")) & 1) != 0)
          break;
        if ((objc_msgSend(v11, "_cn_caseInsensitiveIsEqual:", CFSTR("WORK")) & 1) != 0)
        {
          v14 = CNVCardLabelWork;
          goto LABEL_22;
        }
        if ((objc_msgSend(v11, "_cn_caseInsensitiveIsEqual:", CFSTR("MOBILEME")) & 1) != 0)
        {
          v14 = CNVCardLabelMobileMe;
          goto LABEL_22;
        }
        if ((objc_msgSend(v11, "_cn_caseInsensitiveIsEqual:", CFSTR("OTHER")) & 1) != 0)
        {
          v14 = CNVCardLabelOther;
          goto LABEL_22;
        }
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
          self = v16;
          if (v8)
            goto LABEL_5;
          goto LABEL_14;
        }
      }
      v14 = CNVCardLabelHome;
LABEL_22:
      v5 = *v14;
      v12 = v6;
      goto LABEL_23;
    }
LABEL_14:

    -[CNVCardParser firstCustomLabelForProperty:types:](self, "firstCustomLabelForProperty:types:", v4, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
    {
      -[CNVCardParser fallbackLabelForProperty:](self, "fallbackLabelForProperty:", v4);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = v12;
      v12 = v13;
    }
    v5 = v13;
LABEL_23:

  }
  return v5;
}

- (id)fallbackLabelForProperty:(id)a3
{
  int v3;
  __CFString **v4;

  v3 = objc_msgSend(a3, "isEqual:", CFSTR("URLs"));
  v4 = CNVCardLabelUnknown;
  if (v3)
    v4 = CNVCardLabelURLHomePage;
  return *v4;
}

- (id)phoneLabel
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __CFString **v13;
  void *v14;
  __CFString *v15;
  __CFString **v16;
  __CFString *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[CNVCardParser typeParameters](self, "typeParameters");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (!v4)
  {

LABEL_18:
    -[CNVCardParser firstCustomLabelForProperty:types:](self, "firstCustomLabelForProperty:types:", CFSTR("Phone"), v3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
    {
      -[CNVCardParser fallbackLabelForProperty:](self, "fallbackLabelForProperty:", CFSTR("Phone"));
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = v14;
    }
    v17 = v15;

    goto LABEL_28;
  }
  v5 = v4;
  v6 = 0;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)v20;
  while (2)
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v20 != v10)
        objc_enumerationMutation(v3);
      v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      if ((objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", CFSTR("IPHONE")) & 1) != 0)
      {
        v16 = CNVCardLabelPhoneiPhone;
        goto LABEL_27;
      }
      if ((objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", CFSTR("APPLEWATCH")) & 1) != 0)
      {
        v16 = CNVCardLabelPhoneAppleWatch;
        goto LABEL_27;
      }
      if ((objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", CFSTR("MAIN")) & 1) != 0)
      {
        v16 = CNVCardLabelPhoneMain;
        goto LABEL_27;
      }
      if ((objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", CFSTR("CELL")) & 1) != 0
        || (objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", CFSTR("MOBILE")) & 1) != 0)
      {
        v16 = CNVCardLabelPhoneMobile;
LABEL_27:
        v17 = *v16;

        goto LABEL_28;
      }
      if ((objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", CFSTR("PAGER")) & 1) != 0)
      {
        v16 = CNVCardLabelPager;
        goto LABEL_27;
      }
      v9 |= objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", CFSTR("HOME"));
      v8 |= objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", CFSTR("WORK"));
      v6 |= objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", CFSTR("OTHER"));
      v7 |= objc_msgSend(v12, "_cn_caseInsensitiveIsEqual:", CFSTR("FAX"));
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v5)
      continue;
    break;
  }

  if ((v9 & 1) != 0)
  {
    if ((v7 & 1) != 0)
      v13 = CNVCardLabelPhoneHomeFAX;
    else
      v13 = CNVCardLabelPhoneHome;
    goto LABEL_39;
  }
  if ((v8 & 1) != 0)
  {
    if ((v7 & 1) == 0)
    {
      v13 = CNVCardLabelPhoneWork;
      goto LABEL_39;
    }
    goto LABEL_37;
  }
  if ((v6 & 1) == 0)
  {
    if ((v7 & 1) != 0)
    {
LABEL_37:
      v13 = CNVCardLabelPhoneWorkFAX;
      goto LABEL_39;
    }
    goto LABEL_18;
  }
  if ((v7 & 1) != 0)
    v13 = CNVCardLabelPhoneOtherFAX;
  else
    v13 = CNVCardLabelPhoneOther;
LABEL_39:
  v17 = *v13;
LABEL_28:

  return v17;
}

- (id)firstCustomLabelForProperty:(id)a3 types:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v12[4];
  id v13;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("SocialProfile")) & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", &unk_1E957CF30);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", CFSTR("Email")))
      objc_msgSend(v8, "addObject:", CFSTR("INTERNET"));
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51__CNVCardParser_firstCustomLabelForProperty_types___block_invoke;
    v12[3] = &unk_1E956F8E0;
    v13 = v8;
    v9 = v8;
    objc_msgSend(v6, "_cn_filter:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t __51__CNVCardParser_firstCustomLabelForProperty_types___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__CNVCardParser_firstCustomLabelForProperty_types___block_invoke_2;
  v8[3] = &unk_1E956F8E0;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "_cn_any:", v8) ^ 1;

  return v6;
}

uint64_t __51__CNVCardParser_firstCustomLabelForProperty_types___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_cn_caseInsensitiveIsEqual:", *(_QWORD *)(a1 + 32));
}

- (id)parseStringValue
{
  return -[CNVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:maximumValueLength:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:maximumValueLength:", self->_encoding, self->_quotedPrintable, 36864, 1, -[CNVCardReadingOptions maximumValueLength](self->_options, "maximumValueLength"));
}

- (BOOL)advancePastSemicolon
{
  int v3;

  v3 = -[CNVCardLexer peekAtNextToken](self->_lexer, "peekAtNextToken");
  if (v3 == 4097)
    -[CNVCardLexer advanceToPeekPoint](self->_lexer, "advanceToPeekPoint");
  return v3 == 4097;
}

- (id)parseRemainingLine
{
  void *v3;

  -[CNVCardLexer nextStringInEncoding:quotedPrintable:stopTokens:trim:maximumValueLength:](self->_lexer, "nextStringInEncoding:quotedPrintable:stopTokens:trim:maximumValueLength:", self->_encoding, self->_quotedPrintable, 0x8000, 1, -[CNVCardReadingOptions maximumValueLength](self->_options, "maximumValueLength"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNVCardParser advancePastSemicolon](self, "advancePastSemicolon");
  return v3;
}

- (id)unparsedStringForCurrentProperty
{
  return -[CNVCardParser parseUnknownValueStartingAtPosition:](self, "parseUnknownValueStartingAtPosition:", self->_startingPositionOfCurrentProperty);
}

- (id)parseArrayValue
{
  return -[CNVCardLexer nextArraySeperatedByToken:stoppingAt:inEncoding:maximumValueLength:](self->_lexer, "nextArraySeperatedByToken:stoppingAt:inEncoding:maximumValueLength:", 4096, 0x8000, self->_encoding, -[CNVCardReadingOptions maximumValueLength](self->_options, "maximumValueLength"));
}

- (id)parseUnknownValueStartingAtPosition:(unint64_t)a3
{
  id v5;
  int64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v5 = -[CNVCardParser parseRemainingLine](self, "parseRemainingLine");
  v6 = -[CNVCardParser currentPosition](self, "currentPosition");
  v7 = v6 - a3;
  -[CNVCardLexer stringWithRange:encoding:](self->_lexer, "stringWithRange:encoding:", a3, v6 - a3, self->_encoding);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (((*(uint64_t (**)(void))(*MEMORY[0x1E0D13848] + 16))() & 1) != 0)
  {
    -[CNVCardLexer dataWithRange:](self->_lexer, "dataWithRange:", a3, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v10;
    v8 = v11;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v9);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;

  return v12;
}

- (id)parseBase64Data
{
  return -[CNVCardLexer nextBase64Data](self->_lexer, "nextBase64Data");
}

- (id)nextBase64Data
{
  return -[CNVCardLexer nextBase64Data](self->_lexer, "nextBase64Data");
}

- (BOOL)atEOF
{
  return -[CNVCardLexer atEOF](self->_lexer, "atEOF");
}

- (int64_t)currentPosition
{
  return -[CNVCardLexer cursor](self->_lexer, "cursor");
}

- (CNVCardReadingOptions)options
{
  return self->_options;
}

- (CNVCardParsedResultBuilder)resultBuilder
{
  return self->_resultBuilder;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (_TtP5vCard25CNVCardTagInclusionPolicy_)tagInclusionPolicy
{
  return self->_tagInclusionPolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tagInclusionPolicy, 0);
  objc_storeStrong((id *)&self->_grouping, 0);
  objc_storeStrong((id *)&self->_itemParameters, 0);
  objc_storeStrong((id *)&self->_imageReference, 0);
  objc_storeStrong((id *)&self->_imageGroup, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_cropRects, 0);
  objc_storeStrong((id *)&self->_activityAlerts, 0);
  objc_storeStrong((id *)&self->_socialProfiles, 0);
  objc_storeStrong((id *)&self->_instantMessagingAddresses, 0);
  objc_storeStrong((id *)&self->_carddavUID, 0);
  objc_storeStrong((id *)&self->_uid, 0);
  objc_storeStrong((id *)&self->_unknowns, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong((id *)&self->_notes, 0);
  objc_storeStrong((id *)&self->_addressingGrammars, 0);
  objc_storeStrong((id *)&self->_calendarURIs, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_relatedNames, 0);
  objc_storeStrong((id *)&self->_addresses, 0);
  objc_storeStrong((id *)&self->_phones, 0);
  objc_storeStrong((id *)&self->_dateComponents, 0);
  objc_storeStrong((id *)&self->_emails, 0);
  objc_storeStrong((id *)&self->_altBday, 0);
  objc_storeStrong((id *)&self->_bday, 0);
  objc_storeStrong((id *)&self->_nameComponents, 0);
  objc_storeStrong((id *)&self->_resultBuilder, 0);
  objc_storeStrong((id *)&self->_parameterSelectorMap, 0);
  objc_storeStrong((id *)&self->_parsingSelectorMap, 0);
  objc_storeStrong((id *)&self->_dateComponentsParser, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_lexer, 0);
  objc_storeStrong((id *)&self->_options, 0);
}

- (void)parseNextResultUsingResultBuilder:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D3C07000, v0, v1, "Syntax error: malformed BEGIN", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)parseNextResultUsingResultBuilder:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D3C07000, v0, v1, "Syntax error: malformed EOL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)parseNextResultUsingResultBuilder:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D3C07000, v0, v1, "Syntax error: malformed space after EOL", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)parseNextResultUsingResultBuilder:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D3C07000, v0, v1, "Syntax error: malformed VCARD tag", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)parseNextResultUsingResultBuilder:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1D3C07000, v0, v1, "Syntax error: malformed separator", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)parseLine
{
  OUTLINED_FUNCTION_1(&dword_1D3C07000, a2, a3, "Syntax error: malformed tag: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)parameter_CHARSET:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1(&dword_1D3C07000, a2, a3, "Syntax error: invalid encoding: %{public}@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

@end
