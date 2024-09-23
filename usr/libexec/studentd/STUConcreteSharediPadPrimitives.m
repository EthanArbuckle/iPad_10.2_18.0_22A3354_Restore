@implementation STUConcreteSharediPadPrimitives

- (void)chooseUserWithIdentifier:(id)a3 inClassWithID:(id)a4 password:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = (id)objc_claimAutoreleasedReturnValue(+[LKLoginController sharedController](LKLoginController, "sharedController"));
  objc_msgSend(v13, "chooseUserWithIdentifier:inClassWithID:password:withCompletionHandler:", v12, v11, v10, v9);

}

@end
