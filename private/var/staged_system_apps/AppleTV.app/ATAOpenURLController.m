@implementation ATAOpenURLController

- (void)prepareParsedOpenURL:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;

  v6 = a3;
  v5 = a4;
  if (!v6)
  {
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("The %@ parameter must not be nil."), CFSTR("parsedOpenURL"));
    if (v5)
      goto LABEL_3;
LABEL_5:
    +[NSException raise:format:](NSException, "raise:format:", NSInvalidArgumentException, CFSTR("The %@ parameter must not be nil."), CFSTR("completionHandler"));
    goto LABEL_3;
  }
  if (!v5)
    goto LABEL_5;
LABEL_3:

}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
}

@end
