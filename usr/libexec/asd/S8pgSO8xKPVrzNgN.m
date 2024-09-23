@implementation S8pgSO8xKPVrzNgN

- (void)bQfuQcBGI0pnDtDP:(unint64_t)a3 completion:(id)a4
{
  char v4;
  NSMutableArray *v5;
  NSMutableDictionary *v6;
  void *v7;
  void *v8;
  void (*v9)(void);
  _QWORD *v10;

  v4 = a3;
  v10 = a4;
  v5 = objc_opt_new(NSMutableArray);
  v6 = objc_opt_new(NSMutableDictionary);
  if ((v4 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVSystemController sharedAVSystemController](AVSystemController, "sharedAVSystemController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "attributeForKey:", AVSystemController_CallIsActive));

    if (!v8)
    {
      v9 = (void (*)(void))v10[2];
      goto LABEL_6;
    }
    -[NSMutableDictionary setValue:forKey:](v6, "setValue:forKey:", &off_1004F4AF8, CFSTR("t"));
    -[NSMutableDictionary setValue:forKey:](v6, "setValue:forKey:", v8, CFSTR("sa"));
    -[NSMutableArray insertObject:atIndex:](v5, "insertObject:atIndex:", v6, 0);

  }
  v9 = (void (*)(void))v10[2];
LABEL_6:
  v9();

}

@end
