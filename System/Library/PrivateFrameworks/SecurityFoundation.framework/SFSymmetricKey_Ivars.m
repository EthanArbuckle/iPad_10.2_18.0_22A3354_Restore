@implementation SFSymmetricKey_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->keyData, 0);
}

@end
