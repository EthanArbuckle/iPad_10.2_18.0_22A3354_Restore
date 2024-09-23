@implementation PXPeoplePickerMockDataSourceManager

- (id)createInitialDataSource
{
  PXPeoplePickerMockPerson *v2;
  PXPeoplePickerMockPerson *v3;
  PXPeoplePickerMockPerson *v4;
  PXPeoplePickerMockPerson *v5;
  PXPeoplePickerMockDataSource *v6;
  void *v7;
  PXPeoplePickerMockDataSource *v8;
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v2 = -[PXPeoplePickerMockPerson initWithLocalIdentifier:displayName:]([PXPeoplePickerMockPerson alloc], "initWithLocalIdentifier:displayName:", CFSTR("1"), CFSTR("Christina"));
  v3 = -[PXPeoplePickerMockPerson initWithLocalIdentifier:displayName:]([PXPeoplePickerMockPerson alloc], "initWithLocalIdentifier:displayName:", CFSTR("2"), CFSTR("Jessica"));
  v4 = -[PXPeoplePickerMockPerson initWithLocalIdentifier:displayName:]([PXPeoplePickerMockPerson alloc], "initWithLocalIdentifier:displayName:", CFSTR("3"), CFSTR("Sally"));
  v5 = -[PXPeoplePickerMockPerson initWithLocalIdentifier:displayName:]([PXPeoplePickerMockPerson alloc], "initWithLocalIdentifier:displayName:", CFSTR("4"), CFSTR("Anne"));
  v6 = [PXPeoplePickerMockDataSource alloc];
  v10[0] = v2;
  v10[1] = v3;
  v10[2] = v4;
  v10[3] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[PXPeoplePickerMockDataSource initWithMocks:](v6, "initWithMocks:", v7);

  return v8;
}

@end
