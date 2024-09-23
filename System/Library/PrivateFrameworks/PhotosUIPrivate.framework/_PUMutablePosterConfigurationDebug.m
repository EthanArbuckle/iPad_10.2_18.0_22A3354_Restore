@implementation _PUMutablePosterConfigurationDebug

- (NSString)pu_displayNameLocalizationKey
{
  return self->_pu_displayNameLocalizationKey;
}

- (void)setPu_displayNameLocalizationKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pu_displayNameLocalizationKey, 0);
}

@end
