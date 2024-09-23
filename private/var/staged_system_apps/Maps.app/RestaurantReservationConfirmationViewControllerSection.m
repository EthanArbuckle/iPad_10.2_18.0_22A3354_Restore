@implementation RestaurantReservationConfirmationViewControllerSection

- (NSString)sectionTitle
{
  return self->_sectionTitle;
}

- (void)setSectionTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)sectionText
{
  return self->_sectionText;
}

- (void)setSectionText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sectionText, 0);
  objc_storeStrong((id *)&self->_sectionTitle, 0);
}

@end
