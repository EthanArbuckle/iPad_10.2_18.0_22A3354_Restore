@implementation _PSPeopleSuggestionsMetricsModelInternal

- (_PSPeopleSuggestionsMetricsModelInternal)initWithModelType:(int64_t)a3 trialIdentifier:(id)a4
{
  objc_class *v6;
  char *v7;
  char *v8;
  char *v9;
  id v10;
  _PSPeopleSuggestionsMetricsModelInternal *v11;
  objc_super v13;

  v6 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  v7 = (char *)objc_allocWithZone(v6);
  v8 = &v7[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
  *(_QWORD *)v8 = a3;
  v8[8] = 0;
  v9 = &v7[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
  *(_QWORD *)v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  *(_QWORD *)&v7[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = a4;
  v13.receiver = v7;
  v13.super_class = v6;
  v10 = a4;
  v11 = -[_PSPeopleSuggestionsMetricsModelInternal init](&v13, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v11;
}

- (_PSPeopleSuggestionsMetricsModelInternal)initWithModelIdentifier:(id)a3 trialIdentifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  char *v9;
  char *v10;
  uint64_t *v11;
  id v12;
  _PSPeopleSuggestionsMetricsModelInternal *v13;
  objc_super v15;

  v5 = sub_24549A0B4();
  v7 = v6;
  v8 = (objc_class *)type metadata accessor for PeopleSuggestions.PeopleSuggestion.Model();
  v9 = (char *)objc_allocWithZone(v8);
  v10 = &v9[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_modelType];
  *(_QWORD *)v10 = 0;
  v10[8] = 1;
  v11 = (uint64_t *)&v9[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_otherModelTypeIdentifier];
  *v11 = v5;
  v11[1] = v7;
  *(_QWORD *)&v9[OBJC_IVAR____PSPeopleSuggestionsMetricsModelInternal_trialIdentifier] = a4;
  v15.receiver = v9;
  v15.super_class = v8;
  v12 = a4;
  v13 = -[_PSPeopleSuggestionsMetricsModelInternal init](&v15, sel_init);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v13;
}

- (int64_t)hash
{
  _PSPeopleSuggestionsMetricsModelInternal *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_24547FD6C();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  return sub_2454834B0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_24547FEA0);
}

- (_PSPeopleSuggestionsMetricsModelInternal)init
{
  _PSPeopleSuggestionsMetricsModelInternal *result;

  result = (_PSPeopleSuggestionsMetricsModelInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

- (NSString)description
{
  return (NSString *)sub_245484BD8(self, (uint64_t)a2, (void (*)(void))PeopleSuggestions.PeopleSuggestion.Model.description.getter);
}

@end
