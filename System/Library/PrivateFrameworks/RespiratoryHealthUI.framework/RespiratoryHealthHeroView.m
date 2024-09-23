@implementation RespiratoryHealthHeroView

- (RespiratoryHealthHeroView)init
{
  double v2;
  double v3;
  double v4;
  double v5;
  char *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  RespiratoryHealthHeroCountdownLabel *v23;
  void *v24;
  RespiratoryHealthHeroCountdownLabel *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  objc_super v46;

  v46.receiver = self;
  v46.super_class = (Class)RespiratoryHealthHeroView;
  v2 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v6 = -[RespiratoryHealthHeroView initWithFrame:](&v46, sel_initWithFrame_, *MEMORY[0x24BDBF090], v3, v4, v5);
  if (v6)
  {
    v7 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageNamed:inBundle:withConfiguration:", CFSTR("setup-watch"), v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v9);
    objc_msgSend(v10, "frame");
    *((_QWORD *)v6 + 54) = v11;
    *((_QWORD *)v6 + 55) = v12;
    *((_QWORD *)v6 + 56) = v13;
    *((_QWORD *)v6 + 57) = v14;
    v15 = (void *)*((_QWORD *)v6 + 58);
    *((_QWORD *)v6 + 58) = v10;
    v16 = v10;

    v17 = (void *)MEMORY[0x24BDF6AC8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "imageNamed:inBundle:withConfiguration:", CFSTR("setup-hero"), v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AE8]), "initWithImage:", v19);
    *(_OWORD *)(v6 + 472) = xmmword_227016860;
    *(_OWORD *)(v6 + 488) = xmmword_227016870;
    v21 = (void *)*((_QWORD *)v6 + 63);
    *((_QWORD *)v6 + 63) = v20;
    v22 = v20;

    objc_msgSend(v22, "setFrame:", *((double *)v6 + 59), *((double *)v6 + 60), *((double *)v6 + 61), *((double *)v6 + 62));
    v23 = -[RespiratoryHealthHeroCountdownLabel initWithFrame:]([RespiratoryHealthHeroCountdownLabel alloc], "initWithFrame:", v2, v3, v4, v5);
    v24 = (void *)*((_QWORD *)v6 + 68);
    *((_QWORD *)v6 + 68) = v23;
    v25 = v23;

    objc_msgSend(v22, "frame");
    -[RespiratoryHealthHeroCountdownLabel sizeThatFits:](v25, "sizeThatFits:", v26, v27);
    v29 = v28;
    v31 = v30;
    objc_msgSend(v22, "frame");
    v33 = v32;
    objc_msgSend(v22, "frame");
    v35 = v33 + v34 - v31;
    objc_msgSend(v22, "frame");
    -[RespiratoryHealthHeroCountdownLabel setFrame:](v25, "setFrame:", v36 + 4.0, v35, v29, v31);
    -[RespiratoryHealthHeroCountdownLabel frame](v25, "frame");
    *((_QWORD *)v6 + 64) = v37;
    *((_QWORD *)v6 + 65) = v38;
    *((_QWORD *)v6 + 66) = v39;
    *((_QWORD *)v6 + 67) = v40;
    objc_msgSend(v6, "addSubview:", v16);
    objc_msgSend(v6, "addSubview:", v22);

    objc_msgSend(v6, "addSubview:", v25);
    objc_msgSend(v16, "frame");
    objc_msgSend(v6, "setFrame:");
    objc_msgSend(v16, "frame");
    v42 = v41;
    v44 = v43;

    *((_QWORD *)v6 + 52) = v42;
    *((_QWORD *)v6 + 53) = v44;
    *((_QWORD *)v6 + 69) = v42;

  }
  return (RespiratoryHealthHeroView *)v6;
}

- (CGSize)intrinsicContentSize
{
  double width;
  double height;
  CGSize result;

  width = self->_watchImageSize.width;
  height = self->_watchImageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)validScaleFactorForCandidate:(double)result
{
  if (result > 3.0 || result < 0.75)
    return 1.0;
  return result;
}

- (void)setPreferredWidth:(double)a3
{
  self->_preferredWidth = a3;
  -[RespiratoryHealthHeroView validScaleFactorForCandidate:](self, "validScaleFactorForCandidate:", a3 / self->_watchImageMediumFrame.size.width);
  -[RespiratoryHealthHeroView _updateHeroUIWithScaleFactor:](self, "_updateHeroUIWithScaleFactor:");
}

- (void)_updateHeroUIWithScaleFactor:(double)a3
{
  double width;
  CGFloat v6;
  CGFloat v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;

  if (a3 == 1.0)
  {
    -[UIImageView setFrame:](self->_heroImageView, "setFrame:", self->_heroImageMediumFrame.origin.x, self->_heroImageMediumFrame.origin.y, self->_heroImageMediumFrame.size.width, self->_heroImageMediumFrame.size.height);
    -[UIImageView setFrame:](self->_watchImageView, "setFrame:", self->_watchImageMediumFrame.origin.x, self->_watchImageMediumFrame.origin.y, self->_watchImageMediumFrame.size.width, self->_watchImageMediumFrame.size.height);
    -[RespiratoryHealthHeroCountdownLabel setFrame:](self->_countdownLabel, "setFrame:", self->_countdownLabelMediumFrame.origin.x, self->_countdownLabelMediumFrame.origin.y, self->_countdownLabelMediumFrame.size.width, self->_countdownLabelMediumFrame.size.height);
    self->_watchImageSize = self->_watchImageMediumFrame.size;
  }
  else
  {
    width = self->_watchImageMediumFrame.size.width;
    v6 = width * a3;
    v7 = self->_watchImageMediumFrame.size.height * a3;
    v8 = -(width - width * a3) * 0.5;
    -[UIImageView setFrame:](self->_watchImageView, "setFrame:", self->_watchImageMediumFrame.origin.x, self->_watchImageMediumFrame.origin.y, width * a3, v7);
    v9 = self->_heroImageMediumFrame.size.width;
    v10 = self->_heroImageMediumFrame.origin.x + v8 - -(v9 - v9 * a3) * 0.5;
    v11 = (a3 + -1.0) * 8.0 + self->_heroImageMediumFrame.origin.y * a3;
    v12 = self->_heroImageMediumFrame.size.height * a3;
    -[UIImageView setFrame:](self->_heroImageView, "setFrame:", v10, v11, v9 * a3, v12);
    -[RespiratoryHealthHeroCountdownLabel setFrame:](self->_countdownLabel, "setFrame:", v10 + 4.0, v11 + v12 - self->_countdownLabelMediumFrame.size.height * a3, self->_countdownLabelMediumFrame.size.width * a3);
    self->_watchImageSize.width = v6;
    self->_watchImageSize.height = v7;
  }
  -[RespiratoryHealthHeroCountdownLabel setScaleFactor:](self->_countdownLabel, "setScaleFactor:", a3);
  -[RespiratoryHealthHeroView frame](self, "frame");
  -[RespiratoryHealthHeroView setFrame:](self, "setFrame:");
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countdownLabel, 0);
  objc_storeStrong((id *)&self->_heroImageView, 0);
  objc_storeStrong((id *)&self->_watchImageView, 0);
}

@end
