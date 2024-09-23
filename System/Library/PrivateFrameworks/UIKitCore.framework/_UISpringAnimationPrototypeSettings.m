@implementation _UISpringAnimationPrototypeSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UISpringAnimationPrototypeSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[_UISpringAnimationPrototypeSettings setDampingRatio:](self, "setDampingRatio:", 1.0);
  -[_UISpringAnimationPrototypeSettings setResponse:](self, "setResponse:", 0.3);
}

+ (id)settingsControllerModule
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D83078];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Damping Ratio"), CFSTR("dampingRatio"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "between:and:", 0.0, 1.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "precision:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Response"), CFSTR("response"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "between:and:", 0.0, 10.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "precision:", 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionWithRows:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0D83078];
  v21[0] = v10;
  v12 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rowWithTitle:action:", CFSTR("Restore Defaults"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sectionWithRows:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "moduleWithTitle:contents:", 0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)springAnimationBehavior
{
  double v3;
  double v4;
  double v5;

  -[_UISpringAnimationPrototypeSettings dampingRatio](self, "dampingRatio");
  v4 = v3;
  -[_UISpringAnimationPrototypeSettings response](self, "response");
  return +[UIViewSpringAnimationBehavior behaviorWithDampingRatio:response:](UIViewSpringAnimationBehavior, "behaviorWithDampingRatio:response:", v4, v5);
}

- (double)dampingRatio
{
  return self->_dampingRatio;
}

- (void)setDampingRatio:(double)a3
{
  self->_dampingRatio = a3;
}

- (double)response
{
  return self->_response;
}

- (void)setResponse:(double)a3
{
  self->_response = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_springAnimationBehavior, 0);
}

@end
