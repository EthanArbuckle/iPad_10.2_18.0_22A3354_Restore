@implementation VehicleDetailTableSection

- (VehicleDetailTableSection)initWithCells:(id)a3
{
  id v4;
  VehicleDetailTableSection *v5;
  NSArray *v6;
  NSArray *cells;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VehicleDetailTableSection;
  v5 = -[VehicleDetailTableSection init](&v9, "init");
  if (v5)
  {
    v6 = (NSArray *)objc_msgSend(v4, "copy");
    cells = v5->_cells;
    v5->_cells = v6;

  }
  return v5;
}

- (NSArray)cells
{
  return self->_cells;
}

- (void)setCells:(id)a3
{
  objc_storeStrong((id *)&self->_cells, a3);
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (void)setHeaderTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)footerText
{
  return self->_footerText;
}

- (void)setFooterText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerText, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_storeStrong((id *)&self->_cells, 0);
}

@end
