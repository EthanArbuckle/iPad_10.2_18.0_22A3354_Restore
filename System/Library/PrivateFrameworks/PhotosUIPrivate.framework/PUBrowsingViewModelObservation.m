@implementation PUBrowsingViewModelObservation

- (PUBrowsingViewModelObservation)initWithViewModel:(id)a3 changeHandler:(id)a4
{
  id v6;
  PUBrowsingViewModelObservation *v7;
  objc_super v9;
  _QWORD v10[4];
  id v11;

  v10[1] = 3221225472;
  v10[2] = __66__PUBrowsingViewModelObservation_initWithViewModel_changeHandler___block_invoke;
  v10[3] = &unk_1E58AA5E0;
  v11 = a4;
  v9.receiver = self;
  v9.super_class = (Class)PUBrowsingViewModelObservation;
  v10[0] = MEMORY[0x1E0C809B0];
  v6 = v11;
  v7 = -[PUViewModelObservation initWithViewModel:changeHandler:](&v9, sel_initWithViewModel_changeHandler_, a3, v10);

  return v7;
}

uint64_t __66__PUBrowsingViewModelObservation_initWithViewModel_changeHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
