@implementation PBReaderHyperlinkInfo

- (NSString)screenTip
{
  return self->mScreenTip;
}

- (NSString)hyperlink1
{
  return self->mHyperlink1;
}

- (NSString)hyperlink2
{
  return self->mHyperlink2;
}

- (void)setScreenTip:(id)a3
{
  objc_storeStrong((id *)&self->mScreenTip, a3);
}

- (void)setHyperlink1:(id)a3
{
  objc_storeStrong((id *)&self->mHyperlink1, a3);
}

- (void)setHyperlink2:(id)a3
{
  objc_storeStrong((id *)&self->mHyperlink2, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mScreenTip, 0);
  objc_storeStrong((id *)&self->mHyperlink2, 0);
  objc_storeStrong((id *)&self->mHyperlink1, 0);
}

@end
