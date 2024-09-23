@implementation SFKey_Ivars

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->attributes, 0);
}

@end
