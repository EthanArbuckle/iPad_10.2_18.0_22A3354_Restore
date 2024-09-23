@implementation SurveyContentView.Coordinator

- (void)surveyQuestionGadgetPresentOneUp:(id)a3 keyAsset:(id)a4 assetCollection:(id)a5 regionOfInterest:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  id v16;
  _TtCV12PhotosUICoreP33_AFC00BCA01978D7A3A12D1D9F0B75D8117SurveyContentView11Coordinator *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v11 = type metadata accessor for LemonadeNavigationDestination(0);
  MEMORY[0x1E0C80A78](v11);
  v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = a4;
  v15 = a3;
  v16 = a5;
  v26 = a6;
  v17 = self;
  sub_1A688D398();
  sub_1A688D398();
  v18 = v16;
  sub_1A6BC7008();
  *(_QWORD *)v13 = v19;
  *((_QWORD *)v13 + 1) = v20;
  v13[16] = v21;
  v13[17] = v22 & 1;
  v13[18] = v23 & 1;
  *((_QWORD *)v13 + 3) = v24;
  swift_storeEnumTagMultiPayload();
  sub_1A6D24CA0((uint64_t)v13, a6);
  sub_1A67EC0B0((uint64_t)v13, type metadata accessor for LemonadeNavigationDestination);

}

- (void)surveyQuestionGadget:(id)a3 presentAssetCollection:(id)a4 regionOfInterest:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtCV12PhotosUICoreP33_AFC00BCA01978D7A3A12D1D9F0B75D8117SurveyContentView11Coordinator *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1A6D26268(v9, a5);

}

- (void)surveyQuestionGadget:(id)a3 presentViewController:(id)a4 regionOfInterest:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  id *v11;
  id v12;
  id v13;
  id v14;
  _TtCV12PhotosUICoreP33_AFC00BCA01978D7A3A12D1D9F0B75D8117SurveyContentView11Coordinator *v15;
  uint64_t v16;

  v9 = type metadata accessor for LemonadeNavigationDestination(0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (id *)((char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  *v11 = a4;
  swift_storeEnumTagMultiPayload();
  v12 = a4;
  v13 = a3;
  v14 = a5;
  v15 = self;
  sub_1A6D24CA0((uint64_t)v11, a5);
  sub_1A67EC0B0((uint64_t)v11, type metadata accessor for LemonadeNavigationDestination);

}

- (_TtCV12PhotosUICoreP33_AFC00BCA01978D7A3A12D1D9F0B75D8117SurveyContentView11Coordinator)init
{
  _TtCV12PhotosUICoreP33_AFC00BCA01978D7A3A12D1D9F0B75D8117SurveyContentView11Coordinator *result;

  result = (_TtCV12PhotosUICoreP33_AFC00BCA01978D7A3A12D1D9F0B75D8117SurveyContentView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1A67EC0B0((uint64_t)self+ OBJC_IVAR____TtCV12PhotosUICoreP33_AFC00BCA01978D7A3A12D1D9F0B75D8117SurveyContentView11Coordinator_representable, type metadata accessor for SurveyContentView);
}

@end
