@implementation MapsSuggestionsBaseFeeler

- (MapsSuggestionsBaseFeeler)initWithDelegate:(id)a3 name:(id)a4
{
  id v6;
  MapsSuggestionsBaseFeeler *v7;
  NSString *v8;
  NSString *name;
  id v10;
  objc_super v12;
  id location;

  objc_initWeak(&location, a3);
  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MapsSuggestionsBaseFeeler;
  v7 = -[MapsSuggestionsBaseFeeler init](&v12, "init");
  if (v7)
  {
    v8 = (NSString *)objc_msgSend(v6, "copy");
    name = v7->_name;
    v7->_name = v8;

    v10 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v7->_delegate, v10);

  }
  objc_destroyWeak(&location);
  return v7;
}

- (MapsSuggestionsBaseFeeler)initWithDelegate:(id)a3
{
  id v4;
  id v5;
  void *v6;
  MapsSuggestionsBaseFeeler *v7;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "description");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[MapsSuggestionsBaseFeeler initWithDelegate:name:](self, "initWithDelegate:name:", v4, v6);

  return v7;
}

- (MapsSuggestionsBaseFeeler)init
{
  return -[MapsSuggestionsBaseFeeler initWithDelegate:](self, "initWithDelegate:", 0);
}

- (NSString)uniqueName
{
  return self->_name;
}

+ (BOOL)isEnabled
{
  BOOL result;

  result = objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

- (void)setDelegate:(id)a3
{
  id v4;

  v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);

}

- (MapsSuggestionsFeelerDelegate)delegate
{
  return (MapsSuggestionsFeelerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (int64_t)disposition
{
  int64_t result;

  result = (int64_t)-[MapsSuggestionsBaseFeeler doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

- (BOOL)canProduceSignalType:(int64_t)a3
{
  BOOL result;

  result = -[MapsSuggestionsBaseFeeler doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  __break(1u);
  return result;
}

- (NSString)description
{
  id v3;
  NSString *v4;
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v3 = objc_alloc((Class)NSString);
  v9.receiver = self;
  v9.super_class = (Class)MapsSuggestionsBaseFeeler;
  v4 = -[MapsSuggestionsBaseFeeler description](&v9, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsBaseFeeler uniqueName](self, "uniqueName"));
  v7 = objc_msgSend(v3, "initWithFormat:", CFSTR("%@ '%@'"), v5, v6);

  return (NSString *)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
