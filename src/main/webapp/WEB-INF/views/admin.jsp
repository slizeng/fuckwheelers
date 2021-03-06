<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="pageTitle" scope="request" value="Admin Profile"/>
<%@ include file="header.jsp" %>

<div class="page-action">Admin Profile</div>

<div class="manage-items">
    <a href="item" id="manageItems">Manage items</a>
</div>

<div class="page-action">All orders</div>

<table class="table admin-table">
    <tbody>
    <c:forEach var="order" items="${reserveOrders}" varStatus="row">
        <tr>
            <form:form action="admin" method="post">
                <td>
                    <a href="/userProfile/${order.account.account_name}">
                        <c:out value="${order.account.account_name}"/>
                    </a>
                </td>
                <td><c:out value="${order.item.name}"/></td>
                <td><c:out value="${order.reserve_time}"/></td>
                <td>
                    <select name="state">
                        <c:forEach var="statusoption" items="${order.statusOptions}" varStatus="row">
                            <option ${order.status == statusoption ? 'selected="selected"' : ""}>${statusoption}</option>
                        </c:forEach>
                    </select>
                </td>
                <td><textarea rows="3" name="note">${order.note}</textarea></td>
                <td>
                    <input type="hidden" value="${order.orderId}" name="orderId" />
                    <button type="submit" name="save" value="Save Changes">Save Changes</button>
                </td>
            </form:form>
        </tr>
    </c:forEach>
    </tbody>
    <thead>
    <tr>
        <th class="user-th">User</th>
        <th class="order-th">Order</th>
        <th class="order-time-th">Order Time</th>
        <th class="status-th">Status</th>
        <th class="note-th">Note</th>
        <th class="button-th"></th>
    </tr>
    </thead>
</table>


<%@ include file="footer.jsp" %>