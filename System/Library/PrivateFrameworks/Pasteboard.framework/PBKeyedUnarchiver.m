@implementation PBKeyedUnarchiver

- (NSSet)allowedClasses
{
  return self->_allowedClasses;
}

- (void)setAllowedClasses:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allowedClasses, 0);
}

@end
