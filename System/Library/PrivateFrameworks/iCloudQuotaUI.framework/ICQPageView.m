@implementation ICQPageView

- (id)horizontalConstraintsForView:(id)a3 margin:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if ((objc_msgSend(v6, "isHidden") & 1) != 0)
  {
    v7 = (void *)MEMORY[0x24BDBD1A8];
  }
  else
  {
    objc_msgSend(v6, "leftAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQPageView leftAnchor](self, "leftAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(v6, "rightAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQPageView rightAnchor](self, "rightAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, -a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v13;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

@end
