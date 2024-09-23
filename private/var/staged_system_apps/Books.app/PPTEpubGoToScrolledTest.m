@implementation PPTEpubGoToScrolledTest

- (PPTEpubGoToScrolledTest)initWithName:(id)a3 options:(id)a4 testDefinition:(id)a5 isMainTest:(BOOL)a6
{
  PPTEpubGoToScrolledTest *v6;
  PPTEpubGoToScrolledTest *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PPTEpubGoToScrolledTest;
  v6 = -[PPTBasicTest initWithName:options:testDefinition:isMainTest:](&v9, "initWithName:options:testDefinition:isMainTest:", a3, a4, a5, a6);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_targetLayout, kBETestDriverEpubLayoutVerticalScroll);
  return v7;
}

- (void)startTest
{
  void *v3;
  uint64_t v4;
  char isKindOfClass;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned int v9;
  __CFString *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  char v15;
  void *v16;
  void *v17;
  unsigned int v18;
  NSString *targetLayout;
  NSObject *v20;
  id v21;
  uint8_t v22[16];
  uint8_t buf[16];

  -[PPTBasicTest setRunning:](self, "setRunning:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  v4 = objc_opt_class(BKBookViewController);
  isKindOfClass = objc_opt_isKindOfClass(v3, v4);

  if ((isKindOfClass & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
    v7 = objc_claimAutoreleasedReturnValue(+[AETestDriver getBookControllerLayout:](AETestDriver, "getBookControllerLayout:", v6));
LABEL_5:
    v10 = (__CFString *)v7;

    goto LABEL_7;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
  v9 = +[RETestDriver isValidWithViewController:](_TtC5Books12RETestDriver, "isValidWithViewController:", v8);

  if (v9)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
    v7 = objc_claimAutoreleasedReturnValue(+[RETestDriver getBookControllerLayoutWithViewController:](_TtC5Books12RETestDriver, "getBookControllerLayoutWithViewController:", v6));
    goto LABEL_5;
  }
  v10 = &stru_10091C438;
LABEL_7:
  if (-[__CFString isEqualToString:](v10, "isEqualToString:", self->_targetLayout))
  {
    -[PPTBasicTest startPPTTest](self, "startPPTTest");
    -[PPTBasicTest finishPPTTestWithResult:](self, "finishPPTTestWithResult:", 0);
  }
  else
  {
    v11 = sub_1001DA41C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "We do not have the correct layout, changing it", buf, 2u);
    }

    -[PPTBasicTest subscribeToStartNotification:endNotification:](self, "subscribeToStartNotification:endNotification:", kBETestDriverPagedToScrolledAnimationStart, kBETestDriverPagedToScrolledAnimationEnd);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
    v14 = objc_opt_class(BKBookViewController);
    v15 = objc_opt_isKindOfClass(v13, v14);

    if ((v15 & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
      +[AETestDriver setBookController:layout:](AETestDriver, "setBookController:layout:", v16, self->_targetLayout);

    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
      v18 = +[RETestDriver isValidWithViewController:](_TtC5Books12RETestDriver, "isValidWithViewController:", v17);

      if (v18)
      {
        targetLayout = self->_targetLayout;
        v20 = objc_claimAutoreleasedReturnValue(-[PPTBasicTest bookController](self, "bookController"));
        +[RETestDriver setBookControllerLayout:viewController:](_TtC5Books12RETestDriver, "setBookControllerLayout:viewController:", targetLayout, v20);
      }
      else
      {
        v21 = sub_1001DA41C();
        v20 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v22 = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "bookController is not the correct class", v22, 2u);
        }
      }

    }
  }

}

- (NSString)targetLayout
{
  return self->_targetLayout;
}

- (void)setTargetLayout:(id)a3
{
  objc_storeStrong((id *)&self->_targetLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetLayout, 0);
}

@end
