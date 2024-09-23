@implementation SKUIReportAConcernReason

- (NSNumber)reasonID
{
  return self->_reasonID;
}

- (void)setReasonID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)uppercaseName
{
  return self->_uppercaseName;
}

- (void)setUppercaseName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uppercaseName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_reasonID, 0);
}

@end
