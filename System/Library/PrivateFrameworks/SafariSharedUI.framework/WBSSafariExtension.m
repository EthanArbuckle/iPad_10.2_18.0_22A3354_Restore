@implementation WBSSafariExtension

- (WBSSafariExtension)initWithExtension:(id)a3 extensionsController:(id)a4
{
  id v5;
  WBSSafariExtension *v6;
  WBSSafariExtension *v7;
  WBSSafariExtension *v8;
  objc_super v10;

  v5 = a4;
  v10.receiver = self;
  v10.super_class = (Class)WBSSafariExtension;
  v6 = -[WBSSafariExtension init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_extensionsController, v5);
    v8 = v7;
  }

  return v7;
}

- (void)setBundleCodeRef:(__SecCode *)a3
{
  __SecCode *bundleCodeRef;

  bundleCodeRef = self->_bundleCodeRef;
  if (bundleCodeRef != a3)
  {
    if (a3)
    {
      CFRetain(a3);
      bundleCodeRef = self->_bundleCodeRef;
    }
    if (bundleCodeRef)
      CFRelease(bundleCodeRef);
    self->_bundleCodeRef = a3;
  }
}

- (void)dealloc
{
  __SecCode *bundleCodeRef;
  objc_super v4;

  bundleCodeRef = self->_bundleCodeRef;
  if (bundleCodeRef)
    CFRelease(bundleCodeRef);
  v4.receiver = self;
  v4.super_class = (Class)WBSSafariExtension;
  -[WBSSafariExtension dealloc](&v4, sel_dealloc);
}

- (WBSExtensionsController)extensionsController
{
  return (WBSExtensionsController *)objc_loadWeakRetained((id *)&self->_extensionsController);
}

- (void)setExtensionsController:(id)a3
{
  objc_storeWeak((id *)&self->_extensionsController, a3);
}

- (NSURL)safariExtensionBaseURI
{
  return self->_safariExtensionBaseURI;
}

- (void)setSafariExtensionBaseURI:(id)a3
{
  objc_storeStrong((id *)&self->_safariExtensionBaseURI, a3);
}

- (NSUUID)baseURIHost
{
  return self->_baseURIHost;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (__SecCode)bundleCodeRef
{
  return self->_bundleCodeRef;
}

- (NSDictionary)untrustedCodeSigningDictionary
{
  return self->_untrustedCodeSigningDictionary;
}

- (void)setUntrustedCodeSigningDictionary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)injectedScripts
{
  return self->_injectedScripts;
}

- (void)setInjectedScripts:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)injectedStyleSheets
{
  return self->_injectedStyleSheets;
}

- (void)setInjectedStyleSheets:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSUUID)privacyPreservingProfileIdentifier
{
  return self->_privacyPreservingProfileIdentifier;
}

- (void)setPrivacyPreservingProfileIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_privacyPreservingProfileIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyPreservingProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_injectedStyleSheets, 0);
  objc_storeStrong((id *)&self->_injectedScripts, 0);
  objc_storeStrong((id *)&self->_untrustedCodeSigningDictionary, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_baseURIHost, 0);
  objc_storeStrong((id *)&self->_safariExtensionBaseURI, 0);
  objc_destroyWeak((id *)&self->_extensionsController);
}

@end
