@implementation CRLanguageRecognitionSession

- (CRLanguageRecognitionSession)init
{
  const char *v2;
  CRLanguageRecognitionSession *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLanguageRecognitionSession;
  v3 = -[CRLanguageRecognitionSession init](&v5, sel_init);
  if (v3)
  {
    if (qword_1ED0B4518 != -1)
      dispatch_once(&qword_1ED0B4518, &__block_literal_global_12);
    objc_setProperty_atomic(v3, v2, (id)_MergedGlobals_16, 16);
  }
  return v3;
}

void __36__CRLanguageRecognitionSession_init__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)_MergedGlobals_16;
  _MergedGlobals_16 = v0;

}

- (void)completeSession
{
  SEL v3;
  id Property;
  _QWORD *v5;

  if (self)
  {
    v5 = objc_getProperty(self, a2, 8, 1);
    Property = objc_getProperty(self, v3, 16, 1);
    -[CRLanguageRecognitionContext runRecognitionWithRecognizer:force:](v5, Property, 1);
  }
  else
  {
    v5 = 0;
    -[CRLanguageRecognitionContext runRecognitionWithRecognizer:force:](0, 0, 1);
  }

}

- (void)processFeature:(void *)a3 context:
{
  id v5;
  SEL v6;
  id Property;
  id v8;

  if (a1)
  {
    v5 = a3;
    v8 = a2;
    Property = objc_getProperty(a1, v6, 16, 1);
    -[CRLanguageRecognitionContext processFeature:recognizer:]((uint64_t)v5, v8, Property);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_languageRecognizer, 0);
  objc_storeStrong((id *)&self->_latinLanguageRecognitionContext, 0);
}

@end
