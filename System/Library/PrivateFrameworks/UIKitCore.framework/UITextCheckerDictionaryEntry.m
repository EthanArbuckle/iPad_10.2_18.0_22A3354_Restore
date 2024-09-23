@implementation UITextCheckerDictionaryEntry

- (void)dealloc
{
  __CFSet *dictionary;
  objc_super v4;

  dictionary = self->dictionary;
  if (dictionary)
    CFRelease(dictionary);
  v4.receiver = self;
  v4.super_class = (Class)UITextCheckerDictionaryEntry;
  -[UITextCheckerDictionaryEntry dealloc](&v4, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->data, 0);
}

@end
