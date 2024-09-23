@implementation PKPaymentPreference

- (PKPaymentPreference)initWithTitle:(id)a3 preferences:(id)a4 selectedIndex:(unint64_t)a5 readOnly:(BOOL)a6
{
  id v10;
  id v11;
  PKPaymentPreference *v12;
  PKPaymentPreference *v13;
  NSMutableDictionary *v14;
  NSMutableDictionary *errors;
  uint64_t v16;
  NSString *title;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKPaymentPreference;
  v12 = -[PKPaymentPreference init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_preferences, a4);
    v13->_selectedIndex = a5;
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    errors = v13->_errors;
    v13->_errors = v14;

    v13->_isReadOnly = a6;
    v16 = objc_msgSend(v10, "copy");
    title = v13->_title;
    v13->_title = (NSString *)v16;

    v13->_pendingIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v13;
}

- (void)setErrors:(id)a3 forPreference:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  if (-[NSArray indexOfObject:](self->_preferences, "indexOfObject:", v6) != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableDictionary setObject:forKey:](self->_errors, "setObject:forKey:", v7, v6);

}

- (id)errorsForPreference:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_errors, "objectForKey:", a3);
}

- (void)clearAllErrors
{
  NSMutableDictionary *v3;
  NSMutableDictionary *errors;

  v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  errors = self->_errors;
  self->_errors = v3;

}

- (BOOL)preferenceObject:(id)a3 representsContact:(id)a4
{
  return 0;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)footer
{
  return self->_footer;
}

- (void)setFooter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (_NSRange)footerLinkRange
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_footerLinkRange.length;
  location = self->_footerLinkRange.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setFooterLinkRange:(_NSRange)a3
{
  self->_footerLinkRange = a3;
}

- (id)footerLinkActionBlock
{
  return self->_footerLinkActionBlock;
}

- (void)setFooterLinkActionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)preferences
{
  return self->_preferences;
}

- (void)setPreferences:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (unint64_t)selectedIndex
{
  return self->_selectedIndex;
}

- (void)setSelectedIndex:(unint64_t)a3
{
  self->_selectedIndex = a3;
}

- (unint64_t)pendingIndex
{
  return self->_pendingIndex;
}

- (void)setPendingIndex:(unint64_t)a3
{
  self->_pendingIndex = a3;
}

- (BOOL)isReadOnly
{
  return self->_isReadOnly;
}

- (void)setIsReadOnly:(BOOL)a3
{
  self->_isReadOnly = a3;
}

- (BOOL)supportsDeletion
{
  return self->_supportsDeletion;
}

- (NSMutableDictionary)errors
{
  return self->_errors;
}

- (void)setErrors:(id)a3
{
  objc_storeStrong((id *)&self->_errors, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferences, 0);
  objc_storeStrong(&self->_footerLinkActionBlock, 0);
  objc_storeStrong((id *)&self->_footer, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_errors, 0);
}

@end
