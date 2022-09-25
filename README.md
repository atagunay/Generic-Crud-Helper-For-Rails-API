# Generic Crud Helper For Rails API

### Example Usage

```ruby
class Api::V1::ExampleController < ApplicationController
  include Helper::CrudHelper

  # override
  def object_params
    params.require(:model_name).permit(:params_1)
  end

end
```
