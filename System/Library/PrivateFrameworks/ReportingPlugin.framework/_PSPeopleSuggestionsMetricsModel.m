@implementation _PSPeopleSuggestionsMetricsModel

- (_PSPeopleSuggestionsMetricsModel)initWithModelType:(int64_t)a3 trialIdentifier:(id)a4
{
  id v5;
  _PSPeopleSuggestionsMetricsModel *v6;
  _PSPeopleSuggestionsMetricsModelInternal *v7;
  void *v8;
  uint64_t v9;
  _PSPeopleSuggestionsMetricsModelInternal *underlyingObject;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_PSPeopleSuggestionsMetricsModel;
  v5 = a4;
  v6 = -[_PSPeopleSuggestionsMetricsModel init](&v12, sel_init);
  v7 = [_PSPeopleSuggestionsMetricsModelInternal alloc];
  objc_msgSend(v5, "underlyingObject", v12.receiver, v12.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[_PSPeopleSuggestionsMetricsModelInternal initWithModelType:trialIdentifier:](v7, "initWithModelType:trialIdentifier:", a3, v8);
  underlyingObject = v6->_underlyingObject;
  v6->_underlyingObject = (_PSPeopleSuggestionsMetricsModelInternal *)v9;

  return v6;
}

- (_PSPeopleSuggestionsMetricsModel)initWithModelIdentifier:(id)a3 trialIdentifier:(id)a4
{
  id v5;
  id v6;
  _PSPeopleSuggestionsMetricsModel *v7;
  _PSPeopleSuggestionsMetricsModelInternal *v8;
  void *v9;
  uint64_t v10;
  _PSPeopleSuggestionsMetricsModelInternal *underlyingObject;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_PSPeopleSuggestionsMetricsModel;
  v5 = a4;
  v6 = a3;
  v7 = -[_PSPeopleSuggestionsMetricsModel init](&v13, sel_init);
  v8 = [_PSPeopleSuggestionsMetricsModelInternal alloc];
  objc_msgSend(v5, "underlyingObject", v13.receiver, v13.super_class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = -[_PSPeopleSuggestionsMetricsModelInternal initWithModelIdentifier:trialIdentifier:](v8, "initWithModelIdentifier:trialIdentifier:", v6, v9);
  underlyingObject = v7->_underlyingObject;
  v7->_underlyingObject = (_PSPeopleSuggestionsMetricsModelInternal *)v10;

  return v7;
}

- (_PSPeopleSuggestionsMetricsModelInternal)underlyingObject
{
  return (_PSPeopleSuggestionsMetricsModelInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_underlyingObject, 0);
}

@end
