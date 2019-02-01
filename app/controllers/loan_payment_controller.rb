class LoanPaymentController < ApplicationController
  def loan_payment
    @apr = params.fetch("annual_percentage_rate").to_f
    @years = params.fetch("number_of_years").to_i
    @principal = params.fetch("principal_value").to_f
@rate=@apr/1200
@months=@years*-12
@denominator=1-(1+@rate)**@months
@payment=@rate*@principal/@denominator

    # ================================================================================
    # Your code goes below.
    # The annual percentage rate the user input is in the decimal @apr.
    # The number of years the user input is in the integer @years.
    # The principal value the user input is in the decimal @principal.
    # ================================================================================

    @monthly_payment = + @payment.to_s

    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("loan_payment_templates/loan_payment.html.erb")
  end

  def loan_payment_form
    render("loan_payment_templates/loan_payment_form.html.erb")
  end
end


# apr=apr.to_f
# years=years.chomp.to_i
# balance=balance.chomp.to_f
# rate=apr/1200
# months=years*-12
# denominator=1-(1+rate)**months
# payment=rate*balance/denominator