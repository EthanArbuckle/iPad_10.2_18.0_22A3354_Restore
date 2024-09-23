@implementation TVLoadingImageView

void __37___TVLoadingImageView__fadeInFadeOut__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAlpha:", 0.4);

}

void __37___TVLoadingImageView__fadeInFadeOut__block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id *v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[4];
  id v7;

  v1 = (void *)MEMORY[0x24BDF6F90];
  v2 = MEMORY[0x24BDAC760];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __37___TVLoadingImageView__fadeInFadeOut__block_invoke_3;
  v6[3] = &unk_24EB854F8;
  v3 = (id *)(a1 + 32);
  objc_copyWeak(&v7, (id *)(a1 + 32));
  v4[0] = v2;
  v4[1] = 3221225472;
  v4[2] = __37___TVLoadingImageView__fadeInFadeOut__block_invoke_4;
  v4[3] = &unk_24EB86C20;
  objc_copyWeak(&v5, v3);
  objc_msgSend(v1, "animateWithDuration:delay:options:animations:completion:", 0, v6, v4, 0.6, 0.0);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&v7);
}

void __37___TVLoadingImageView__fadeInFadeOut__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setAlpha:", 0.0);

}

void __37___TVLoadingImageView__fadeInFadeOut__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_fadeInFadeOut");

}

@end
