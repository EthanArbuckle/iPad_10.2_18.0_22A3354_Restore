@implementation MTAEditAlarmVolumeCell

- (MTAEditAlarmVolumeCell)initWithFrame:(CGRect)a3
{
  MTAEditAlarmVolumeCell *v3;
  MTAEditAlarmVolumeCell *v4;
  MTAEditAlarmVolumeCell *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MTAEditAlarmVolumeCell;
  v3 = -[MTAEditAlarmVolumeCell initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[MTAEditAlarmVolumeCell commonInit](v3, "commonInit");
    v5 = v4;
  }

  return v4;
}

- (MTAEditAlarmVolumeCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  MTAEditAlarmVolumeCell *v4;
  MTAEditAlarmVolumeCell *v5;
  MTAEditAlarmVolumeCell *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MTAEditAlarmVolumeCell;
  v4 = -[MTAEditAlarmVolumeCell initWithStyle:reuseIdentifier:](&v8, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    -[MTAEditAlarmVolumeCell commonInit](v4, "commonInit");
    v6 = v5;
  }

  return v5;
}

- (void)commonInit
{
  -[MTAEditAlarmVolumeCell buildVolumeSlider](self, "buildVolumeSlider");
  -[MTAEditAlarmVolumeCell setupConstraints](self, "setupConstraints");
}

- (void)buildVolumeSlider
{
  id v3;
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
  id v15;

  v3 = objc_alloc_init((Class)UISlider);
  -[MTAEditAlarmVolumeCell setVolumeSlider:](self, "setVolumeSlider:", v3);

  v15 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.556862745, 0.556862745, 0.576470588, 1.0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell detailTextLabel](self, "detailTextLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "font"));
  objc_msgSend(v5, "pointSize");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mtui_imageWithSymbolName:pointSize:color:](UIImage, "mtui_imageWithSymbolName:pointSize:color:", CFSTR("volume.fill"), v15));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell volumeSlider](self, "volumeSlider"));
  objc_msgSend(v7, "setMinimumValueImage:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell detailTextLabel](self, "detailTextLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "font"));
  objc_msgSend(v9, "pointSize");
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage mtui_imageWithSymbolName:pointSize:color:](UIImage, "mtui_imageWithSymbolName:pointSize:color:", CFSTR("volume.3.fill"), v15));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell volumeSlider](self, "volumeSlider"));
  objc_msgSend(v11, "setMaximumValueImage:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell volumeSlider](self, "volumeSlider"));
  objc_msgSend(v12, "addTarget:action:forControlEvents:", self, "soundVolumeChanged:", 4096);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell contentView](self, "contentView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell volumeSlider](self, "volumeSlider"));
  objc_msgSend(v13, "addSubview:", v14);

}

- (void)setupConstraints
{
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell volumeSlider](self, "volumeSlider"));
  objc_msgSend(v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v23 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell contentView](self, "contentView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell volumeSlider](self, "volumeSlider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "topAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 5.0));
  objc_msgSend(v23, "addObject:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell volumeSlider](self, "volumeSlider"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerYAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerYAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  objc_msgSend(v23, "addObject:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell volumeSlider](self, "volumeSlider"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutMarginsGuide"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v16, 0.0));
  objc_msgSend(v23, "addObject:", v17);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell volumeSlider](self, "volumeSlider"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "trailingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layoutMarginsGuide"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "trailingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:constant:", v21, 0.0));
  objc_msgSend(v23, "addObject:", v22);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);
}

- (void)drawDebugFrames
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor")));
  v4 = objc_msgSend(v3, "CGColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell volumeSlider](self, "volumeSlider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "layer"));
  objc_msgSend(v6, "setBorderColor:", v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell volumeSlider](self, "volumeSlider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "layer"));
  objc_msgSend(v8, "setBorderWidth:", 2.0);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell layer](self, "layer"));
  objc_msgSend(v9, "setBorderWidth:", 2.0);

  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blueColor](UIColor, "blueColor")));
  v10 = objc_msgSend(v12, "CGColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell layer](self, "layer"));
  objc_msgSend(v11, "setBorderColor:", v10);

}

- (void)soundVolumeChanged:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell delegate](self, "delegate", a3));
  objc_msgSend(v4, "cellDidEditAlarmVolume:", self);

}

- (void)setAlarm:(id)a3
{
  void *v5;
  unsigned int v6;
  double v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  objc_storeStrong((id *)&self->_alarm, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "sound"));
  v6 = objc_msgSend(v5, "isSilent");

  if (v6)
  {
    LODWORD(v7) = 0;
    -[MTAEditAlarmVolumeCell setAlarmVolume:](self, "setAlarmVolume:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell volumeSlider](self, "volumeSlider"));
    v9 = v8;
    v10 = 0;
  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTAlarm sound](self->_alarm, "sound"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "soundVolume"));
    objc_msgSend(v12, "floatValue");
    -[MTAEditAlarmVolumeCell setAlarmVolume:](self, "setAlarmVolume:");

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell volumeSlider](self, "volumeSlider"));
    v9 = v8;
    v10 = 1;
  }
  objc_msgSend(v8, "setEnabled:", v10);

}

- (float)alarmVolume
{
  void *v2;
  float v3;
  float v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell volumeSlider](self, "volumeSlider"));
  objc_msgSend(v2, "value");
  v4 = v3;

  return v4;
}

- (void)setAlarmVolume:(float)a3
{
  double v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTAEditAlarmVolumeCell volumeSlider](self, "volumeSlider"));
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setValue:", v4);

}

- (MTAlarm)alarm
{
  return self->_alarm;
}

- (MTAEditAlarmVolumeCellDelegate)delegate
{
  return (MTAEditAlarmVolumeCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UISlider)volumeSlider
{
  return self->_volumeSlider;
}

- (void)setVolumeSlider:(id)a3
{
  objc_storeStrong((id *)&self->_volumeSlider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeSlider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_alarm, 0);
}

@end
