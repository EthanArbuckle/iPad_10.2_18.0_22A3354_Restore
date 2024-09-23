@implementation TVAppLoadingView

void __34___TVAppLoadingView_loadingScreen__block_invoke()
{
  void *v0;
  void *v1;
  int v2;
  _TVAppLoadingView *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "tv_launchImage");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForInfoDictionaryKey:", CFSTR("UITemplateLaunchImage"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLValue");

  v3 = [_TVAppLoadingView alloc];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  if (v2)
    v5 = v0;
  else
    v5 = 0;
  v6 = -[_TVAppLoadingView initWithFrame:templateImage:](v3, "initWithFrame:templateImage:", v5);
  v7 = (void *)loadingScreen_loadingScreen;
  loadingScreen_loadingScreen = v6;

  v8 = loadingScreen_loadingScreen;
  *(_QWORD *)(loadingScreen_loadingScreen + 440) = 0x4024000000000000;
  *(_QWORD *)(v8 + 448) = 0;

}

uint64_t __54___TVAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke(uint64_t a1, double a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __54___TVAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke_2;
  v3[3] = &unk_24EB85440;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 6, v3, 0, 0.6, a2);
}

uint64_t __54___TVAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "startAnimating");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setAlpha:", 1.0);
}

uint64_t __54___TVAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.0);
}

uint64_t __25___TVAppLoadingView_hide__block_invoke(uint64_t a1)
{
  id *v2;

  v2 = *(id **)(a1 + 32);
  if (v2[58])
  {
    objc_msgSend(v2[58], "_setTintOpacity:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setAlpha:", 0.0);
    v2 = *(id **)(*(_QWORD *)(a1 + 32) + 416);
  }
  return objc_msgSend(v2, "setAlpha:", 0.0);
}

uint64_t __25___TVAppLoadingView_hide__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "stopAnimating");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 432) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setHidden:", 1);
}

@end
