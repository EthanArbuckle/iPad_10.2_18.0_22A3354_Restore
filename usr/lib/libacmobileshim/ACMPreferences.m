@implementation ACMPreferences

- (void)dealloc
{
  objc_super v3;

  -[ACMPreferences setPreferencesStore:](self, "setPreferencesStore:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ACMPreferences;
  -[ACMPreferences dealloc](&v3, sel_dealloc);
}

- (id)preferencesValueForKey:(id)a3 withOptions:(int64_t)a4
{
  return (id)-[ACMPreferencesStore preferencesValueForKey:withOptions:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "preferencesValueForKey:withOptions:", a3, a4);
}

- (void)setPreferencesValue:(id)a3 forKey:(id)a4 withOptions:(int64_t)a5
{
  -[ACMPreferencesStore setPreferencesValue:forKey:withOptions:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "setPreferencesValue:forKey:withOptions:", a3, a4, a5);
}

- (id)multiplePreferencesValuesForKeys:(id)a3 withOptions:(int64_t)a4
{
  return (id)-[ACMPreferencesStore multiplePreferencesValuesForKeys:withOptions:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "multiplePreferencesValuesForKeys:withOptions:", a3, a4);
}

- (void)setMultiplePreferencesValues:(id)a3 withOptions:(int64_t)a4
{
  -[ACMPreferencesStore setMultiplePreferencesValues:withOptions:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "setMultiplePreferencesValues:withOptions:", a3, a4);
}

- (id)preferencesValueForKey:(id)a3
{
  return (id)-[ACMPreferencesStore preferencesValueForKey:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "preferencesValueForKey:", a3);
}

- (void)setPreferencesValue:(id)a3 forKey:(id)a4
{
  -[ACMPreferencesStore setPreferencesValue:forKey:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "setPreferencesValue:forKey:", a3, a4);
}

- (id)multiplePreferencesValuesForKeys:(id)a3
{
  return (id)-[ACMPreferencesStore multiplePreferencesValuesForKeys:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "multiplePreferencesValuesForKeys:", a3);
}

- (void)setMultiplePreferencesValues:(id)a3
{
  -[ACMPreferencesStore setMultiplePreferencesValues:](-[ACMPreferences preferencesStore](self, "preferencesStore"), "setMultiplePreferencesValues:", a3);
}

- (ACMPreferencesStore)preferencesStore
{
  return (ACMPreferencesStore *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPreferencesStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

@end
