@implementation STMutableStatusItemVisualDescriptor

- (NSString)systemImageName
{
  return self->systemImageName;
}

- (void)setSystemImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)imageName
{
  return self->imageName;
}

- (void)setImageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)packageName
{
  return self->packageName;
}

- (void)setPackageName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)textLabel
{
  return self->textLabel;
}

- (void)setTextLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->textLabel, 0);
  objc_storeStrong((id *)&self->packageName, 0);
  objc_storeStrong((id *)&self->imageName, 0);
  objc_storeStrong((id *)&self->systemImageName, 0);
}

@end
