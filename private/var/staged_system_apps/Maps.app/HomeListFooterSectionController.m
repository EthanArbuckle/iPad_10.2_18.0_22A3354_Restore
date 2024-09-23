@implementation HomeListFooterSectionController

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC4Maps31HomeListFooterSectionController_rapReportMenuProvider));
}

- (void)homeActionFooterViewDidTapShareMyLocation:(id)a3
{
  sub_1001B0258(self, (uint64_t)a2, a3, (SEL *)&selRef_homeDidTapShareMyLocation);
}

- (void)homeActionFooterViewDidTapMarkMyLocation:(id)a3
{
  sub_1001B0258(self, (uint64_t)a2, a3, (SEL *)&selRef_homeDidTapMarkMyLocation);
}

- (void)homeActionFooterViewDidTapReportAProblem:(id)a3
{
  id v4;
  _TtC4Maps31HomeListFooterSectionController *v5;

  v4 = a3;
  v5 = self;
  sub_1001B097C();

}

- (void)homeActionFooterViewDidTapTermsAndConditions:(id)a3
{
  sub_1001B0258(self, (uint64_t)a2, a3, (SEL *)&selRef_homeDidTapTermsAndConditions);
}

- (id)homeActionFooterViewUIMenuForRAP:(id)a3
{
  void *v4;
  _TtC4Maps31HomeListFooterSectionController *v5;
  _TtC4Maps31HomeListFooterSectionController *v6;
  _TtC4Maps31HomeListFooterSectionController *v7;
  _TtC4Maps31HomeListFooterSectionController *v8;
  id v9;

  v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC4Maps25HomeListSectionController_configuration);
  v5 = (_TtC4Maps31HomeListFooterSectionController *)a3;
  v6 = self;
  v7 = (_TtC4Maps31HomeListFooterSectionController *)objc_msgSend(v4, "_maps_mapsSceneDelegate");
  if (v7)
  {
    v8 = v7;
    if (MapsFeature_IsEnabled_RAPCommunityID())
      v9 = objc_msgSend(*(id *)((char *)&v6->super.super.isa+ OBJC_IVAR____TtC4Maps31HomeListFooterSectionController_rapReportMenuProvider), "getReportMenuFromEntryPoint:sceneDelegate:", 8, v8);
    else
      v9 = 0;

    v5 = v6;
  }
  else
  {
    v9 = 0;
    v8 = v6;
  }

  return v9;
}

@end
