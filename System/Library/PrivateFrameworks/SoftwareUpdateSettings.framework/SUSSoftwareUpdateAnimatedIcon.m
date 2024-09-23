@implementation SUSSoftwareUpdateAnimatedIcon

- (SUSSoftwareUpdateAnimatedIcon)initWithFrame:(CGRect)a3
{
  UIImageView *v3;
  UIImageView *innerGearView;
  UIImageView *v5;
  UIImageView *outerGearShadowView;
  UIImageView *v7;
  UIImageView *outerGearView;
  SUSSoftwareUpdateAnimatedIcon *v10;
  objc_super v11;
  SEL v12;
  SUSSoftwareUpdateAnimatedIcon *v13;
  CGRect v14;

  v14 = a3;
  v12 = a2;
  v13 = 0;
  v11.receiver = self;
  v11.super_class = (Class)SUSSoftwareUpdateAnimatedIcon;
  v13 = -[SUSSoftwareUpdateAnimatedIcon initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  objc_storeStrong((id *)&v13, v13);
  if (v13)
  {
    v3 = -[SUSSoftwareUpdateAnimatedIcon innerGearView](v13, "innerGearView");
    innerGearView = v13->_innerGearView;
    v13->_innerGearView = v3;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v13->_innerGearView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SUSSoftwareUpdateAnimatedIcon addSubview:](v13, "addSubview:", v13->_innerGearView);
    v5 = -[SUSSoftwareUpdateAnimatedIcon outerGearShadowView](v13, "outerGearShadowView");
    outerGearShadowView = v13->_outerGearShadowView;
    v13->_outerGearShadowView = v5;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v13->_outerGearShadowView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SUSSoftwareUpdateAnimatedIcon addSubview:](v13, "addSubview:", v13->_outerGearShadowView);
    v7 = -[SUSSoftwareUpdateAnimatedIcon outerGearView](v13, "outerGearView");
    outerGearView = v13->_outerGearView;
    v13->_outerGearView = v7;

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v13->_outerGearView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[SUSSoftwareUpdateAnimatedIcon addSubview:](v13, "addSubview:", v13->_outerGearView);
    -[SUSSoftwareUpdateAnimatedIcon createConstraints](v13, "createConstraints");
  }
  v10 = v13;
  objc_storeStrong((id *)&v13, 0);
  return v10;
}

- (void)createConstraints
{
  double v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  double v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;

  v5 = (id)-[UIImageView centerXAnchor](self->_innerGearView, "centerXAnchor");
  v4 = (id)-[SUSSoftwareUpdateAnimatedIcon centerXAnchor](self, "centerXAnchor");
  v3 = (id)objc_msgSend(v5, "constraintEqualToAnchor:");
  objc_msgSend(v3, "setActive:", 1);

  v8 = (id)-[UIImageView centerYAnchor](self->_innerGearView, "centerYAnchor");
  v7 = (id)-[SUSSoftwareUpdateAnimatedIcon centerYAnchor](self, "centerYAnchor");
  v6 = (id)objc_msgSend(v8, "constraintEqualToAnchor:");
  objc_msgSend(v6, "setActive:", 1);

  v11 = (id)-[UIImageView centerXAnchor](self->_outerGearView, "centerXAnchor");
  v10 = (id)-[SUSSoftwareUpdateAnimatedIcon centerXAnchor](self, "centerXAnchor");
  v9 = (id)objc_msgSend(v11, "constraintEqualToAnchor:");
  objc_msgSend(v9, "setActive:", 1);

  v14 = (id)-[UIImageView centerYAnchor](self->_outerGearView, "centerYAnchor");
  v13 = (id)-[SUSSoftwareUpdateAnimatedIcon centerYAnchor](self, "centerYAnchor");
  v12 = (id)objc_msgSend(v14, "constraintEqualToAnchor:");
  objc_msgSend(v12, "setActive:", 1);

  v15 = (id)objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  objc_msgSend(v15, "scale");
  v16 = 1.0 / v2;

  v19 = (id)-[UIImageView centerXAnchor](self->_outerGearShadowView, "centerXAnchor");
  v18 = (id)-[SUSSoftwareUpdateAnimatedIcon centerXAnchor](self, "centerXAnchor");
  v17 = (id)objc_msgSend(v19, "constraintEqualToAnchor:");
  objc_msgSend(v17, "setActive:", 1);

  v22 = (id)-[UIImageView centerYAnchor](self->_outerGearShadowView, "centerYAnchor");
  v21 = (id)-[SUSSoftwareUpdateAnimatedIcon centerYAnchor](self, "centerYAnchor");
  v20 = (id)objc_msgSend(v22, "constraintEqualToAnchor:constant:", v16);
  objc_msgSend(v20, "setActive:", 1);

}

- (UIImageView)innerGearView
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8[3];

  v8[2] = self;
  v8[1] = (id)a2;
  v4 = objc_alloc(MEMORY[0x24BEBD668]);
  v3 = (void *)MEMORY[0x24BEBD640];
  v6 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("PreferencesIconInnerGear"));
  v8[0] = (id)objc_msgSend(v4, "initWithImage:");

  objc_msgSend(v8[0], "setOpaque:", 1);
  v7 = v8[0];
  objc_storeStrong(v8, 0);
  return (UIImageView *)v7;
}

- (UIImageView)outerGearShadowView
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  v4 = objc_alloc(MEMORY[0x24BEBD668]);
  v3 = (void *)MEMORY[0x24BEBD640];
  v6 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("PreferencesIconOuterGearShadow"));
  v7 = (void *)objc_msgSend(v4, "initWithImage:");

  return (UIImageView *)v7;
}

- (UIImageView)outerGearView
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;

  v4 = objc_alloc(MEMORY[0x24BEBD668]);
  v3 = (void *)MEMORY[0x24BEBD640];
  v6 = (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (id)objc_msgSend(v3, "imageNamed:inBundle:", CFSTR("PreferencesIconOuterGear"));
  v7 = (void *)objc_msgSend(v4, "initWithImage:");

  return (UIImageView *)v7;
}

- (void)setAnimating:(BOOL)a3
{
  double v3;
  double v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  BOOL v18;
  SEL v19;
  SUSSoftwareUpdateAnimatedIcon *v20;

  v20 = self;
  v19 = a2;
  v18 = a3;
  if (a3 != self->_animating)
  {
    v20->_animating = v18;
    if (v18)
    {
      v17 = (id)objc_msgSend(MEMORY[0x24BDE5648], "animationWithKeyPath:", CFSTR("transform.rotation"));
      v8 = v17;
      LODWORD(v3) = 1086918619;
      v9 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v3);
      objc_msgSend(v8, "setByValue:");

      objc_msgSend(v17, "setFillMode:", *MEMORY[0x24BDE5978]);
      objc_msgSend(v17, "setRemovedOnCompletion:", 0);
      objc_msgSend(v17, "setDuration:", 10.0);
      objc_msgSend(v17, "setRepeatDuration:", INFINITY);
      v10 = v17;
      v11 = (id)objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D30]);
      objc_msgSend(v10, "setTimingFunction:");

      v12 = (id)-[UIImageView layer](v20->_outerGearView, "layer");
      objc_msgSend(v12, "addAnimation:forKey:", v17, CFSTR("outerRotation"));

      v13 = (id)-[UIImageView layer](v20->_outerGearShadowView, "layer");
      objc_msgSend(v13, "addAnimation:forKey:", v17, CFSTR("shadowRotation"));

      v14 = v17;
      LODWORD(v4) = -1060565029;
      v15 = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v4);
      objc_msgSend(v14, "setByValue:");

      v16 = (id)-[UIImageView layer](v20->_innerGearView, "layer");
      objc_msgSend(v16, "addAnimation:forKey:", v17, CFSTR("innerRotation"));

      objc_storeStrong(&v17, 0);
    }
    else
    {
      v5 = (id)-[UIImageView layer](v20->_innerGearView, "layer");
      objc_msgSend(v5, "removeAllAnimations");

      v6 = (id)-[UIImageView layer](v20->_outerGearShadowView, "layer");
      objc_msgSend(v6, "removeAllAnimations");

      v7 = (id)-[UIImageView layer](v20->_outerGearView, "layer");
      objc_msgSend(v7, "removeAllAnimations");

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerGearView, 0);
  objc_storeStrong((id *)&self->_outerGearShadowView, 0);
  objc_storeStrong((id *)&self->_innerGearView, 0);
}

@end
