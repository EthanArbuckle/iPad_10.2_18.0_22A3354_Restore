@implementation OnBoardingPresenter

- (_TtC17SequoiaTranslator19OnBoardingPresenter)init
{
  return (_TtC17SequoiaTranslator19OnBoardingPresenter *)sub_10013E8FC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator19OnBoardingPresenter_settingsConnection));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator19OnBoardingPresenter_dataSharingPresenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator19OnBoardingPresenter_initialLocalePair));
  sub_10013EF80((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator19OnBoardingPresenter_presentationContinuation);
}

- (void)siriDataSharingOptInRequestsDismissalFromPresenter:(id)a3
{
  id v4;
  _TtC17SequoiaTranslator19OnBoardingPresenter *v5;

  v4 = a3;
  v5 = self;
  sub_10013EE0C();

}

@end
