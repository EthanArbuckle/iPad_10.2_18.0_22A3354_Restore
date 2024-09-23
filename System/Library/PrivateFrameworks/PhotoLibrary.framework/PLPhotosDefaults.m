@implementation PLPhotosDefaults

- (void)reloadPhotoDefaultValues
{
  -[PLPhotosDefaults _reloadPhotoDefaultValuesAndNotify:](self, "_reloadPhotoDefaultValuesAndNotify:", 1);
}

- (void)_reloadPhotoDefaultValuesAndNotify:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;

  v3 = a3;
  v5 = (id)CFPreferencesCopyAppValue(CFSTR("SummarizeSections"), CFSTR("com.apple.mobileslideshow"));
  if (!v5)
    v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  self->_summarizeMomentSections = objc_msgSend(v5, "BOOLValue");
  if (v3)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("PLPhotosDefaultsDidChangeNotification"), self);
}

+ (id)sharedInstance
{
  id result;

  result = (id)__Defaults;
  if (!__Defaults)
  {
    result = objc_alloc_init(PLPhotosDefaults);
    __Defaults = (uint64_t)result;
  }
  return result;
}

- (PLPhotosDefaults)init
{
  PLPhotosDefaults *v2;
  PLPhotosDefaults *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PLPhotosDefaults;
  v2 = -[PLPhotosDefaults init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[PLPhotosDefaults _reloadPhotoDefaultValuesAndNotify:](v2, "_reloadPhotoDefaultValuesAndNotify:", 0);
    v3->_musicCollection = 0;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  if ((PLPhotosDefaults *)__Defaults == self)
    __Defaults = 0;

  v3.receiver = self;
  v3.super_class = (Class)PLPhotosDefaults;
  -[PLPhotosDefaults dealloc](&v3, sel_dealloc);
}

- (BOOL)summarizeMomentSections
{
  return self->_summarizeMomentSections;
}

- (int)transitionForAnimationMovingForward:(BOOL)a3
{
  int result;
  int v5;
  int v6;

  result = self->_transition;
  if (result == -1)
    result = objc_msgSend((id)objc_opt_class(), "randomTransition");
  if (result == 1)
    v5 = 2;
  else
    v5 = result;
  if (result == 7)
    v6 = 3;
  else
    v6 = v5;
  if (!a3)
    return v6;
  return result;
}

- (int)transition
{
  return self->_transition;
}

- (void)setTransition:(int)a3
{
  self->_transition = a3;
}

- (BOOL)shouldPlayMusic
{
  return self->_shouldPlayMusic;
}

- (void)setShouldPlayMusic:(BOOL)a3
{
  self->_shouldPlayMusic = a3;
}

- (void)setMusicCollection:(id)a3
{
  MPMediaItemCollection *musicCollection;

  musicCollection = self->_musicCollection;
  if (musicCollection != a3)
  {

    self->_musicCollection = (MPMediaItemCollection *)a3;
  }
}

- (id)musicCollection
{
  return self->_musicCollection;
}

+ (int)randomTransition
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;

  if (!randomTransition_transitionsArray)
  {
    v2 = (void *)randomTransition_settingsArray;
    if (!randomTransition_settingsArray)
    {
      v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "pathForResource:ofType:", CFSTR("Photos"), CFSTR("plist"));
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", v3);
      randomTransition_settingsArray = (uint64_t)(id)objc_msgSend(v4, "valueForKey:", CFSTR("items"));

      v2 = (void *)randomTransition_settingsArray;
    }
    v5 = objc_msgSend(v2, "count");
    randomTransition_transitionsArray = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v5 < 1)
    {
LABEL_8:
      v8 = 0;
    }
    else
    {
      v6 = 0;
      while (1)
      {
        v7 = (void *)objc_msgSend((id)randomTransition_settingsArray, "objectAtIndex:", v6);
        if (objc_msgSend((id)objc_msgSend(v7, "objectForKey:", CFSTR("key")), "isEqualToString:", CFSTR("Transition")))break;
        if (v5 == ++v6)
          goto LABEL_8;
      }
      v8 = (void *)objc_msgSend(v7, "valueForKeyPath:", CFSTR("validValues"));
    }
    v9 = objc_msgSend(v8, "count");
    if (v9 >= 1)
    {
      v10 = v9;
      for (i = 0; i != v10; ++i)
      {
        v12 = (void *)objc_msgSend(v8, "objectAtIndex:", i);
        if ((int)objc_msgSend(v12, "intValue") >= 1)
          objc_msgSend((id)randomTransition_transitionsArray, "addObject:", v12);
      }
    }
  }
  return objc_msgSend((id)objc_msgSend((id)randomTransition_transitionsArray, "objectAtIndex:", random() % (unint64_t)objc_msgSend((id)randomTransition_transitionsArray, "count")), "intValue");
}

@end
