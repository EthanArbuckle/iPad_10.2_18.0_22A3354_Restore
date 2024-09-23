@implementation RoutePlanningVehicleSelectionTableViewCell

- (void)setupWithVehicle:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayName"));
  -[UILabel setText:](self->_textLabel, "setText:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "licensePlate"));
  -[UILabel setText:](self->_detailTextLabel, "setText:", v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detailTextLabel, 0);
  objc_storeStrong((id *)&self->_textLabel, 0);
}

@end
