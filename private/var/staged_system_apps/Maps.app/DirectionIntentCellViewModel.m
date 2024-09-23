@implementation DirectionIntentCellViewModel

- (DirectionIntentCellViewModel)initWithLocalSearchCompletion:(id)a3
{
  id v5;
  DirectionIntentCellViewModel *v6;
  DirectionIntentCellViewModel *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)DirectionIntentCellViewModel;
  v6 = -[DirectionIntentCellViewModel init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_localSearchCompletion, a3);
    -[DirectionIntentCellViewModel _calculateStrings](v7, "_calculateStrings");
  }

  return v7;
}

- (void)_calculateStrings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionIntentCellViewModel localSearchCompletion](self, "localSearchCompletion"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "title"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionIntentCellViewModel localSearchCompletion](self, "localSearchCompletion"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subtitle"));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1004B70D0;
  v12[3] = &unk_1011B8AD8;
  v12[4] = self;
  v7 = objc_retainBlock(v12);
  v8 = ((uint64_t (*)(_QWORD *, void *))v7[2])(v7, v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  -[DirectionIntentCellViewModel setTitleCellString:](self, "setTitleCellString:", v9);

  v10 = ((uint64_t (*)(_QWORD *, void *))v7[2])(v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[DirectionIntentCellViewModel setSubtitleCellString:](self, "setSubtitleCellString:", v11);

}

- (id)_titleOfResolvedItem:(id)a3 withSearchCompletion:(id)a4
{
  id v5;
  id v6;
  unsigned __int8 v7;
  uint64_t v8;
  void *v9;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "hasResultIndex");
  if (v6 && (v7 & 1) != 0)
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  else
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "extractedTerm"));
  v9 = (void *)v8;

  return v9;
}

- (NSString)titleCellString
{
  return self->_titleCellString;
}

- (void)setTitleCellString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)subtitleCellString
{
  return self->_subtitleCellString;
}

- (void)setSubtitleCellString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (MKLocalSearchCompletion)localSearchCompletion
{
  return self->_localSearchCompletion;
}

- (void)setLocalSearchCompletion:(id)a3
{
  objc_storeStrong((id *)&self->_localSearchCompletion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localSearchCompletion, 0);
  objc_storeStrong((id *)&self->_subtitleCellString, 0);
  objc_storeStrong((id *)&self->_titleCellString, 0);
}

@end
