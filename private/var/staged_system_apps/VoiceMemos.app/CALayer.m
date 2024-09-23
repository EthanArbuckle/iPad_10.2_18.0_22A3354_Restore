@implementation CALayer

- (void)animateProperty:(id)a3 toValue:(id)a4 timing:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[CALayer valueForKey:](self, "valueForKey:", v10));
  -[CALayer animateProperty:toValue:fromValue:timing:](self, "animateProperty:toValue:fromValue:timing:", v10, v9, v11, v8);

}

- (void)animateProperty:(id)a3 toValue:(id)a4 fromValue:(id)a5 timing:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animation](CABasicAnimation, "animation"));
  objc_msgSend(v17, "setKeyPath:", v13);
  objc_msgSend(v17, "setFromValue:", v11);

  objc_msgSend(v17, "setToValue:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[RCRecorderStyleProvider sharedStyleProvider](RCRecorderStyleProvider, "sharedStyleProvider"));
  objc_msgSend(v14, "recordingControlAnimationDuration");
  objc_msgSend(v17, "setDuration:");

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", v10));
  objc_msgSend(v17, "setTimingFunction:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@Animation"), v13));
  -[CALayer addAnimation:forKey:](self, "addAnimation:forKey:", v17, v16);
  -[CALayer setValue:forKey:](self, "setValue:forKey:", v12, v13);

}

@end
