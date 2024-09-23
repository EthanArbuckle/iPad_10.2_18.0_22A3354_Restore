@implementation SNTestCoordinator

- (SNTestCoordinator)initWithApplication:(id)a3
{
  id v5;
  NSObject *v6;
  SNTestCoordinator *v7;
  SNTestCoordinator *v8;
  objc_super v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = SNDefaultLog;
  if (os_log_type_enabled((os_log_t)SNDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_1D5791000, v6, OS_LOG_TYPE_DEFAULT, "Creating SNTestCoordinator with application %@", buf, 0xCu);
  }
  v10.receiver = self;
  v10.super_class = (Class)SNTestCoordinator;
  v7 = -[SNTestCoordinator init](&v10, sel_init);
  v8 = v7;
  if (v7)
    objc_storeStrong((id *)&v7->_application, a3);

  return v8;
}

- (BOOL)requiresRotationForOrientation:(int64_t)a3
{
  void *v4;

  -[SNTestCoordinator application](self, "application");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "statusBarOrientation") != a3;

  return a3;
}

- (NSString)launchTestName
{
  void *v2;
  __CFString *v3;
  __CFString *v4;
  NSString *v5;

  -[SNTestCoordinator application](self, "application");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_launchTestName");
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("launch");
  v5 = v3;

  return v5;
}

- (void)finishedTestWithTestName:(id)a3 waitForCommit:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)SNDefaultLog;
  if (os_log_type_enabled((os_log_t)SNDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    -[SNTestCoordinator application](self, "application");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412802;
    v12 = v6;
    v13 = 1024;
    v14 = v4;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_1D5791000, v8, OS_LOG_TYPE_DEFAULT, "Marking test %@ as completed with waitForCommit %d on application %@", (uint8_t *)&v11, 0x1Cu);

  }
  -[SNTestCoordinator application](self, "application");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "finishedTest:waitForCommit:extraResults:", v6, v4, 0);

}

- (void)startedTestWithTestName:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)SNDefaultLog;
  if (os_log_type_enabled((os_log_t)SNDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[SNTestCoordinator application](self, "application");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1D5791000, v6, OS_LOG_TYPE_DEFAULT, "Marking test %@ started on application %@", (uint8_t *)&v9, 0x16u);

  }
  -[SNTestCoordinator application](self, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "startedTest:", v4);

}

- (UIApplication)application
{
  return self->_application;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_application, 0);
}

- (void)failedTestWithTestName:(id)a3 failureMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)SNDefaultLog;
  if (os_log_type_enabled((os_log_t)SNDefaultLog, OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    -[SNTestCoordinator application](self, "application");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v6;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1D5791000, v9, OS_LOG_TYPE_DEFAULT, "Marking test %@ failed on application %@ with error %@", (uint8_t *)&v12, 0x20u);

  }
  -[SNTestCoordinator application](self, "application");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "failedTest:withFailure:", v6, v7);

}

- (void)rotateToOrientation:(int64_t)a3 beforeRotation:(id)a4 afterRotation:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v8 = a4;
  v9 = a5;
  -[SNTestCoordinator application](self, "application");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __70__SNTestCoordinator_rotateToOrientation_beforeRotation_afterRotation___block_invoke;
  v15[3] = &unk_1E9A1EC48;
  v16 = v8;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__SNTestCoordinator_rotateToOrientation_beforeRotation_afterRotation___block_invoke_2;
  v13[3] = &unk_1E9A1EC48;
  v11 = v9;
  v12 = v8;
  objc_msgSend(v10, "rotateIfNeeded:before:after:", a3, v15, v13);

}

uint64_t __70__SNTestCoordinator_rotateToOrientation_beforeRotation_afterRotation___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __70__SNTestCoordinator_rotateToOrientation_beforeRotation_afterRotation___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)scrollTestWithTestName:(id)a3 scrollView:(id)a4 iterations:(int64_t)a5 offset:(int64_t)a6 direction:(unint64_t)a7
{
  id v12;
  id v13;

  v12 = a4;
  v13 = a3;
  objc_msgSend(v12, "_performScrollTest:iterations:delta:scrollAxis:", v13, a5, a6, -[SNTestCoordinator axisForDirection:](self, "axisForDirection:", a7));

}

- (void)scrollTestWithTestName:(id)a3 scrollView:(id)a4 iterations:(int64_t)a5 offset:(int64_t)a6 numberOfScreens:(int64_t)a7 direction:(unint64_t)a8
{
  id v14;
  unint64_t v15;
  double v16;
  double v17;
  id v18;

  v14 = a4;
  v18 = a3;
  v15 = -[SNTestCoordinator axisForDirection:](self, "axisForDirection:", a8);
  objc_msgSend(v14, "bounds");
  objc_msgSend(v14, "_performScrollTest:iterations:delta:length:scrollAxis:", v18, a5, a6, -[SNTestCoordinator lengthForNumberOfScreens:direction:size:](self, "lengthForNumberOfScreens:direction:size:", a7, a8, v16, v17), v15);

}

- (void)recapScrollTestWithTestName:(id)a3 scrollView:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;

  v5 = (objc_class *)MEMORY[0x1E0D83C68];
  v6 = a4;
  v7 = a3;
  v8 = (id)objc_msgSend([v5 alloc], "initWithTestName:scrollView:completionHandler:", v7, v6, 0);

  objc_msgSend(MEMORY[0x1E0D83C80], "runTestWithParameters:", v8);
}

- (unint64_t)axisForDirection:(unint64_t)a3
{
  if (a3)
    return 1;
  else
    return 2;
}

- (int64_t)lengthForNumberOfScreens:(int64_t)a3 direction:(unint64_t)a4 size:(CGSize)a5
{
  uint64_t width;

  if (a4 == 1)
  {
    width = (uint64_t)a5.width;
  }
  else
  {
    if (a4)
      return self;
    width = (uint64_t)a5.height;
  }
  return width * a3;
}

@end
