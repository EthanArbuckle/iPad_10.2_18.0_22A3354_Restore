@implementation SBSStereoLeaderInterface

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sbProxy, 0);
  objc_storeStrong((id *)&self->_sbConnection, 0);
}

- (SBSStereoLeaderInterface)init
{
  return -[SBSStereoLeaderInterface initWithTarget:](self, "initWithTarget:", CFSTR("localhost"));
}

- (SBSStereoLeaderInterface)initWithTarget:(id)a3
{
  id v4;
  SBSStereoLeaderInterface *v5;
  uint64_t v6;
  SBSImplementer *sbProxy;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBSStereoLeaderInterface;
  v5 = -[SBSStereoLeaderInterface init](&v9, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("localhost")))
      +[SBSUtils createProxyConnectionForXPCWithExportedObject:connection:](SBSUtils, "createProxyConnectionForXPCWithExportedObject:connection:", 0, &v5->_sbConnection);
    else
      +[SBSUtils createProxyConnectionForRapportTarget:](SBSUtils, "createProxyConnectionForRapportTarget:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    sbProxy = v5->_sbProxy;
    v5->_sbProxy = (SBSImplementer *)v6;

  }
  return v5;
}

- (void)setDeviceAsStereoLeader:(BOOL)a3 withOptions:(id)a4
{
  -[SBSImplementer setDeviceAsStereoLeader:withOptions:](self->_sbProxy, "setDeviceAsStereoLeader:withOptions:", a3, a4);
}

- (void)isFollower:(id)a3
{
  id v4;
  void *v5;
  SBSImplementer *sbProxy;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    sbProxy = self->_sbProxy;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __39__SBSStereoLeaderInterface_isFollower___block_invoke;
    v7[3] = &unk_24EB7E310;
    v8 = v4;
    -[SBSImplementer isDeviceStereoFollower:](sbProxy, "isDeviceStereoFollower:", v7);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->_sbConnection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSStereoLeaderInterface;
  -[SBSStereoLeaderInterface dealloc](&v3, sel_dealloc);
}

void __39__SBSStereoLeaderInterface_isFollower___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

@end
