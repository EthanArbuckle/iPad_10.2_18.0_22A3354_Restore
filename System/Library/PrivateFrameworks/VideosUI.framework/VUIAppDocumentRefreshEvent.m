@implementation VUIAppDocumentRefreshEvent

- (VUIAppDocumentRefreshEvent)initWithDescriptor:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C99DA0];
  v5 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("The %@ initializer is not available."), v6);

  return 0;
}

- (VUIAppDocumentRefreshEvent)initWithRefreshEventDescriptor:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VUIAppDocumentRefreshEvent;
  return -[VUIAppDocumentUpdateEvent initWithDescriptor:](&v4, sel_initWithDescriptor_, a3);
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)VUIAppDocumentRefreshEvent;
  -[VUIAppDocumentUpdateEvent dictionaryRepresentation](&v11, sel_dictionaryRepresentation);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[VUIAppDocumentRefreshEvent _refreshEventDescriptor](self, "_refreshEventDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "delayInSeconds");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v7, CFSTR("delay"));

  objc_msgSend(v5, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vui_setObjectIfNotNil:forKey:", v8, CFSTR("name"));
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

@end
