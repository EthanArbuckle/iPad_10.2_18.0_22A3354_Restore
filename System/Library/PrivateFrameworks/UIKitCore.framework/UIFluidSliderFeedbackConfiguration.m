@implementation UIFluidSliderFeedbackConfiguration

void __59___UIFluidSliderFeedbackConfiguration_defaultConfiguration__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  id v19;

  v2 = a2;
  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hapticParameters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 1050253722;
  objc_msgSend(v4, "setVolume:", v5);

  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hapticParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = 1058642330;
  objc_msgSend(v7, "setVolume:", v8);

  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 9);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hapticParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = 1053609165;
  objc_msgSend(v10, "setVolume:", v11);

  v12 = (void *)*((_QWORD *)v2 + 17);
  *((_QWORD *)v2 + 17) = v3;
  v19 = v3;

  +[_UIDiscreteFeedback discreteFeedbackForType:](_UIDiscreteFeedback, "discreteFeedbackForType:", 11);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)*((_QWORD *)v2 + 15);
  *((_QWORD *)v2 + 15) = v13;

  v15 = (void *)*((_QWORD *)v2 + 16);
  *((_QWORD *)v2 + 16) = v9;
  v16 = v9;

  v17 = (void *)*((_QWORD *)v2 + 14);
  *((_QWORD *)v2 + 14) = v6;
  v18 = v6;

  objc_storeStrong((id *)v2 + 18, CFSTR("edge"));
  objc_storeStrong((id *)v2 + 19, CFSTR("generic_selection"));

}

@end
