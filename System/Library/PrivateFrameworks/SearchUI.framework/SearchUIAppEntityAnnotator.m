@implementation SearchUIAppEntityAnnotator

+ (BOOL)annotateView:(id)a3 withRowModel:(id)a4
{
  id v5;
  id v6;
  char v7;

  v5 = a3;
  v6 = a4;
  v7 = sub_1DAE077D4((uint64_t)v5, v6);

  return v7 & 1;
}

+ (void)resetAnnotationForView:(id)a3
{
  id v3;

  v3 = a3;
  sub_1DAE0D6EC();

}

+ (void)registerCollectionViewController:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D4410);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (void *)objc_opt_self();
  v14 = a3;
  if (objc_msgSend(v7, sel_isAppIntentsSupportEnabled))
  {
    v8 = sub_1DAE0D650();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v6, 1, 1, v8);
    sub_1DAE0D62C();
    v9 = v14;
    v10 = sub_1DAE0D620();
    v11 = (_QWORD *)swift_allocObject();
    v12 = MEMORY[0x1E0DF06E8];
    v11[2] = v10;
    v11[3] = v12;
    v11[4] = v9;
    sub_1DAE06E00((uint64_t)v6, (uint64_t)&unk_1F029E748, (uint64_t)v11);

    swift_release();
  }
  else
  {

  }
}

- (SearchUIAppEntityAnnotator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchUIAppEntityAnnotator;
  return -[SearchUIAppEntityAnnotator init](&v3, sel_init);
}

@end
