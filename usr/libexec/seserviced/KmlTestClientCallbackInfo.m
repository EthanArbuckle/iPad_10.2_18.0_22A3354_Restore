@implementation KmlTestClientCallbackInfo

- (KmlTestClientCallbackInfo)init
{
  KmlTestClientCallbackInfo *v2;
  KmlTestClientCallbackInfo *v3;
  id ownerCompletionHandler;
  uint64_t v5;
  NSMutableSet *invitationSet;
  uint64_t v7;
  NSMutableDictionary *results;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)KmlTestClientCallbackInfo;
  v2 = -[KmlTestClientCallbackInfo init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    ownerCompletionHandler = v2->_ownerCompletionHandler;
    v2->_ownerCompletionHandler = 0;

    v5 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    invitationSet = v3->_invitationSet;
    v3->_invitationSet = (NSMutableSet *)v5;

    v7 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    results = v3->_results;
    v3->_results = (NSMutableDictionary *)v7;

  }
  return v3;
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (void)setResults:(id)a3
{
  objc_storeStrong((id *)&self->_results, a3);
}

- (NSMutableSet)invitationSet
{
  return self->_invitationSet;
}

- (void)setInvitationSet:(id)a3
{
  objc_storeStrong((id *)&self->_invitationSet, a3);
}

- (id)ownerCompletionHandler
{
  return self->_ownerCompletionHandler;
}

- (void)setOwnerCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_ownerCompletionHandler, 0);
  objc_storeStrong((id *)&self->_invitationSet, 0);
  objc_storeStrong((id *)&self->_results, 0);
}

@end
