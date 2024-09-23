@implementation PRPosterSettings

- (void)setDefaultValues
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PRPosterSettings;
  -[PTSettings setDefaultValues](&v3, sel_setDefaultValues);
  -[PRPosterSettings setWakeDuration:](self, "setWakeDuration:", 1.2);
  -[PRPosterSettings setWakeMass:](self, "setWakeMass:", 1.0);
  -[PRPosterSettings setWakeStiffness:](self, "setWakeStiffness:", 61.69);
  -[PRPosterSettings setWakeDamping:](self, "setWakeDamping:", 15.71);
  -[PRPosterSettings setLinearWakeDuration:](self, "setLinearWakeDuration:", 1.2);
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
  void *v21;
  void *v22;
  _QWORD v23[3];
  void *v24;
  void *v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Duration"), CFSTR("wakeDuration"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Mass"), CFSTR("wakeMass"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Stiffness"), CFSTR("wakeStiffness"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Damping"), CFSTR("wakeDamping"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0D83078];
  v26[0] = v22;
  v26[1] = v21;
  v26[2] = v20;
  v26[3] = v2;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sectionWithRows:title:", v4, CFSTR("Wallpaper Wake Animation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D83058], "rowWithTitle:valueKeyPath:", CFSTR("Duration"), CFSTR("linearWakeDuration"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D83078];
  v25 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sectionWithRows:title:", v8, CFSTR("Wallpaper Linear Wake Animation"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D83010];
  objc_msgSend(MEMORY[0x1E0D83080], "action");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rowWithTitle:action:", CFSTR("Restore Defaults"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D83078];
  v24 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionWithRows:title:", v14, CFSTR("Restore Defaults"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1E0D83078];
  v23[0] = v5;
  v23[1] = v9;
  v23[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "moduleWithTitle:contents:", CFSTR("Wake Animation"), v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (double)wakeDuration
{
  return self->_wakeDuration;
}

- (void)setWakeDuration:(double)a3
{
  self->_wakeDuration = a3;
}

- (double)wakeMass
{
  return self->_wakeMass;
}

- (void)setWakeMass:(double)a3
{
  self->_wakeMass = a3;
}

- (double)wakeStiffness
{
  return self->_wakeStiffness;
}

- (void)setWakeStiffness:(double)a3
{
  self->_wakeStiffness = a3;
}

- (double)wakeDamping
{
  return self->_wakeDamping;
}

- (void)setWakeDamping:(double)a3
{
  self->_wakeDamping = a3;
}

- (double)linearWakeDuration
{
  return self->_linearWakeDuration;
}

- (void)setLinearWakeDuration:(double)a3
{
  self->_linearWakeDuration = a3;
}

@end
