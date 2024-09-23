@implementation SSIntentBasedSectionConfiguration

- (NSDictionary)sectionDisplayStrategies
{
  return self->_sectionDisplayStrategies;
}

- (void)setSectionDisplayStrategies:(id)a3
{
  objc_storeStrong((id *)&self->_sectionDisplayStrategies, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionDisplayStrategies, 0);
}

@end
