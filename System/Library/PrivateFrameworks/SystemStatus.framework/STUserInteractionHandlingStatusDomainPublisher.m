@implementation STUserInteractionHandlingStatusDomainPublisher

- (void)handleUserInteractionsWithBlock:(id)a3
{
  char *v4;
  char *v5;
  char *v6;

  v4 = (char *)a3;
  v5 = v4;
  if (self && self->_userInteractionHandlerBlock != v4)
  {
    v6 = v4;
    objc_setProperty_nonatomic_copy(self, v4, v4, 24);
    v5 = v6;
  }

}

- (void)handleUserInteraction:(id)a3 forDomain:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!-[STStatusDomainPublisher isInvalidated](self, "isInvalidated")
    && objc_msgSend((id)objc_opt_class(), "statusDomainName") == a4)
  {
    if (self)
    {
      v6 = self->_userInteractionHandlerBlock;
      if (v6)
      {
        v7 = v6;
        (*((void (**)(id, id))v6 + 2))(v6, v8);

      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_userInteractionHandlerBlock, 0);
}

@end
