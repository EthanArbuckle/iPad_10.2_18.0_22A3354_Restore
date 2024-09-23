@implementation PGFeatureExtractorLocale

- (PGFeatureExtractorLocale)init
{
  PGFeatureExtractorLocale *v2;
  uint64_t v3;
  NSLocale *currentLocale;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PGFeatureExtractorLocale;
  v2 = -[PGFeatureExtractorLocale init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v3 = objc_claimAutoreleasedReturnValue();
    currentLocale = v2->_currentLocale;
    v2->_currentLocale = (NSLocale *)v3;

  }
  return v2;
}

- (NSLocale)currentLocale
{
  return self->_currentLocale;
}

- (void)setCurrentLocale:(id)a3
{
  objc_storeStrong((id *)&self->_currentLocale, a3);
}

- (id)name
{
  __CFString *v2;

  v2 = CFSTR("Locale");
  return CFSTR("Locale");
}

- (id)featureNames
{
  _QWORD v3[22];

  v3[21] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("Other");
  v3[1] = CFSTR("en_US");
  v3[2] = CFSTR("zh_CN");
  v3[3] = CFSTR("ja_JP");
  v3[4] = CFSTR("pt_BR");
  v3[5] = CFSTR("en_GB");
  v3[6] = CFSTR("es_MX");
  v3[7] = CFSTR("de_DE");
  v3[8] = CFSTR("en_CA");
  v3[9] = CFSTR("it_IT");
  v3[10] = CFSTR("ru_RU");
  v3[11] = CFSTR("tr_TR");
  v3[12] = CFSTR("fr_FR");
  v3[13] = CFSTR("en_AU");
  v3[14] = CFSTR("ko_KR");
  v3[15] = CFSTR("es_ES");
  v3[16] = CFSTR("es_US");
  v3[17] = CFSTR("en_IN");
  v3[18] = CFSTR("vi_VN");
  v3[19] = CFSTR("nl_NL");
  v3[20] = CFSTR("th_TH");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 21);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)featureLength
{
  return 21;
}

- (id)floatVectorWithEntity:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;

  objc_msgSend(MEMORY[0x1E0D42A48], "zerosOfCount:", -[PGFeatureExtractorLocale featureLength](self, "featureLength", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGFeatureExtractorLocale featureNames](self, "featureNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGFeatureExtractorLocale currentLocale](self, "currentLocale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localeIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "indexOfObject:", v8);

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    v11 = 0;
  else
    v11 = v9;
  LODWORD(v10) = 1.0;
  objc_msgSend(v5, "setFloat:atIndex:", v11, v10);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentLocale, 0);
}

@end
