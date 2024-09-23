@implementation CalendarTipsManager

- (void)configureTipsCenter
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[TipsManager shared](_TtC9MobileCal11TipsManager, "shared"));
  objc_msgSend(v2, "configureTipsCenter");

}

- (void)donateIsPortraitOrientation:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[TipsManager shared](_TtC9MobileCal11TipsManager, "shared"));
  objc_msgSend(v4, "setIsPortraitOrientationTo:", v3);

}

- (void)donateIsSelectedDateFiveDaysAwayFromToday:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[TipsManager shared](_TtC9MobileCal11TipsManager, "shared"));
  objc_msgSend(v4, "setIsSelectedDateFiveDaysAwayFromTodayTo:", v3);

}

- (void)addObserversForController:(id)a3 todayButton:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[TipsManager shared](_TtC9MobileCal11TipsManager, "shared"));
  objc_msgSend(v7, "addTipObserversFor:todayButton:", v6, v5);

}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001CC6C;
  block[3] = &unk_1001B2DA0;
  block[4] = a1;
  if (qword_1001F6108 != -1)
    dispatch_once(&qword_1001F6108, block);
  return (id)qword_1001F6100;
}

- (CalendarTipsManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CalendarTipsManager;
  return -[CalendarTipsManager init](&v3, "init");
}

- (void)updatePresentedControllerTo:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[TipsManager shared](_TtC9MobileCal11TipsManager, "shared"));
  objc_msgSend(v4, "updatePresentedController:", v3);

}

- (void)dismissTipDueToUserNavigationWithCompletionBlock:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TipsManager shared](_TtC9MobileCal11TipsManager, "shared"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10004E084;
  v6[3] = &unk_1001B2E30;
  v7 = v3;
  v5 = v3;
  objc_msgSend(v4, "dismissTipIfPresentedWithCompletionBlock:", v6);

}

- (void)donateTodayButtonPressed
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(+[TipsManager shared](_TtC9MobileCal11TipsManager, "shared"));
  objc_msgSend(v2, "jumpToTodayActionPerformed");

}

- (void)donateShouldDisplayTip:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[TipsManager shared](_TtC9MobileCal11TipsManager, "shared"));
  objc_msgSend(v4, "setShouldDisplayJumpToTodayTipTo:", v3);

}

@end
