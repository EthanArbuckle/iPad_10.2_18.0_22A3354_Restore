@implementation ICQUsageMediaImageView

- (ICQUsageMediaImageView)init
{
  ICQUsageMediaImageView *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICQUsageMediaImageView;
  v2 = -[ICQUsageMediaImageView init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICQUsageMediaImageView setBackgroundColor:](v2, "setBackgroundColor:", v3);

    -[ICQUsageMediaImageView setContentMode:](v2, "setContentMode:", 1);
  }
  return v2;
}

- (void)sizeToFit
{
  -[ICQUsageMediaImageView frame](self, "frame");
  -[ICQUsageMediaImageView setFrame:](self, "setFrame:");
}

@end
